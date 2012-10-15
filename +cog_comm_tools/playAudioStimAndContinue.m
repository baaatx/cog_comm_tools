% Function that starts playing the WAV data inside of an audioStim object and then
% continues. (Wrapped from PTB example).
%
% audioStim - an audioStim object
%
%
% Author: Brian Armstrong
%
function [portAudioHandle, startTime] = playAudioStimAndContinue(audioStim)
    % wrapped example from the PTB output example

    % Open the default audio device [], with default mode [] (==Only playback),
    % and a required latencyclass of zero 0 == no low-latency mode, as well as
    % a frequency of freq and nrchannels sound channels.
    % This returns a handle to the audio device:
    
    numChannels = audioStim.numChannels;
    frequency = audioStim.frequency;
    waveData = audioStim.waveData;
    
    try
        % Try with the frequency returned by wavread:
        portAudioHandle = PsychPortAudio('Open', [], [], 0, frequency, numChannels);
    catch
        % Failed. so we retry with the frequency as suggested by device:
        psychlasterror('reset');
        portAudioHandle = PsychPortAudio('Open', [], [], 0, [], numChannels);
    end

    % Fill the audio playback buffer with the audio data 'wavedata':
    PsychPortAudio('FillBuffer', portAudioHandle, waveData);

    % Start audio playback for one time through the sound data,
    % start it immediately (0) and wait for the playback to start, return onset
    % timestamp.
    startTime = PsychPortAudio('Start', portAudioHandle, 1, 0, 1);