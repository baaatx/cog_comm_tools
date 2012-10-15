% Function that plays the WAV data inside of an audioStim object and waits
% for an amount of time equal to the length of the wav data before
% continuing.
%
% audioStim - an audioStim object
%
%
% Author: Brian Armstrong
%
function startTime = playAudioStim(audioStim)
    % play the wav data
    [portAudioHandle, startTime] = cog_comm_tools.playAudioStimAndContinue(audioStim);
    
    % wait
    WaitSecs(audioStim.audioLength);
    
    % Stop playback:
    PsychPortAudio('Stop', portAudioHandle);

    % Close the audio device:
    PsychPortAudio('Close', portAudioHandle);