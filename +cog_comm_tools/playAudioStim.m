% Function that plays the WAV data inside of an audioStim object and waits
% for an amount of time equal to the length of the wav data before
% continuing.
%
% audioStim - an audioStim object
%
%
% Author: Brian Armstrong
%
function playAudioStim(audioStim)
    % play the wav data
    sound (audioStim.audioSamples, audioStim.audioFileSize);
    
    % wait
    WaitSecs(audioStim.audioLength);