% This is a handle class that represents a single audio stimulus used in an
% experiment.
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
      audioFileSize
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
           [obj.audioSamples, obj.audioFileSize] = wavread(wavFileName);
           
           % store the audio length...
           obj.audioLength = (length(obj.audioSamples)) / obj.audioFileSize;
       end
   end
end % classdef