% Function that starts playing the WAV data inside of an audioStim object and then
% continues.
%
% Author: Brian Armstrong
%
function playAudioStimAndContinue(audioStim)
    % just start the playing of sound data
    sound (audioStim.audioSamples, audioStim.audioFileSize);