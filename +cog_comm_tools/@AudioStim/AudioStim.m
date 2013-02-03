% This is a handle class that represents a single audio stimulus used in an
% experiment. The Audio stim contains its own audio driver reference so
% it can play itself.
%
% Constructor Parameters:
%
% keyCode - (string) keyCode for the stim
%
% wavFileName - (string) full path fileName to wave file to create an
% Audiostim from.
%
% title - (optional) a title for the AudioStim.
%
%
% Author: Brian Armstrong
%
classdef AudioStim < handle
   properties (SetAccess = private, GetAccess = public)
      keyCode
      wavFileName
      audioSamples
      waveData
      frequency
      bitsPerSecond
      numChannels
      portAudioHandle
      propertiesMap
   end
   properties  (SetAccess = public, GetAccess = public)
      title
      valid
      lastStartTime
      lastEndTime
      audioLength
   end
   methods
       function obj = AudioStim(keyCode, wavFileName, title)
           % setting a title is optional
           if (nargin<3)
               obj.title = 'untitled audio stim';
           else
               obj.title = title;    
           end
           
           % default that this is a valid stimulus
           obj.valid = true;
           
           % initialize stim object
           obj.keyCode = keyCode;
           obj.wavFileName = wavFileName;
           
           % get the wave data
           [obj.audioSamples, obj.frequency, obj.bitsPerSecond] = wavread(wavFileName);
           
           % transpose the wave data for consumption by PTB audio port
           obj.waveData = obj.audioSamples';
           
           % determine number of channels
           obj.numChannels = size(obj.waveData,1);
           
           % store the audio length...
           obj.audioLength = (length(obj.audioSamples)) / obj.frequency;
           
           % create an internal map so other properties and objects can
           % be associated with this object
           obj.propertiesMap = containers.Map();
       end
       function setProperty(obj, key, value)
        obj.propertiesMap(key) = value;
       end
       function value = getProperty(obj, key)
        value = obj.propertiesMap(key);
       end
       
       function open(obj)
        try
            % Try with the frequency returned by wavread:
            obj.portAudioHandle = PsychPortAudio('Open', [], [], 0, obj.frequency, obj.numChannels);
        catch
            % Failed. so we retry with the frequency as suggested by device:
            psychlasterror('reset');
            obj.portAudioHandle = PsychPortAudio('Open', [], [], 0, [], obj.numChannels);
        end

        % Fill the audio playback buffer with the audio data 'wavedata':
        PsychPortAudio('FillBuffer', obj.portAudioHandle, obj.waveData);
       end
       function startTime = play(obj)
        % Start audio playback for one time through the sound data,
        % start it immediately (0) and wait for the playback to start, return onset
        % timestamp.
        startTime = PsychPortAudio('Start', obj.portAudioHandle, 1, 0, 1);
       end
       function stop(obj)
        % Stop playback:
        PsychPortAudio('Stop', obj.portAudioHandle);
       end
       function close(obj)
        % Close the audio device:
        PsychPortAudio('Close', obj.portAudioHandle);
       end
   end
end % classdef