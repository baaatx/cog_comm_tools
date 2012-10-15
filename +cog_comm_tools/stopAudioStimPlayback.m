% Function that stops the WAV playback of an open and playing
% audio handle (playing audio stim) and closes the audio handle
%
% portAudioHandle - an open audio handle
%
% Author: Brian Armstrong
%
function stopAudioStimPlayback(portAudioHandle)
    % Stop playback:
    PsychPortAudio('Stop', portAudioHandle);

    % Close the audio device:
    PsychPortAudio('Close', portAudioHandle);