% Function that records audio from the microphone into a wavFile by
% participantId - waits until a mouse click is read to stop recording.

function recordAudioFromMicrophoneUntilMouseClick(participantId, wavFileName)
%
% Parameters:
%
% participantId   = participant's unique id
%
% wavfilename = Name of a .wav sound file to store the recorded sound to.
%
% recordingLength = How long to record for.
%
% Authors: Brian Armstrong, Dylan Bumford
%

% Open the default audio device [], with mode 2 (== Only audio capture),
% and a required latencyclass of zero 0 == no low-latency mode, as well as
% a frequency of 44100 Hz and 2 sound channels for stereo capture.
% This returns a handle to the audio device:
freq = 44100;
pahandle = PsychPortAudio('Open', [], 2, 0, freq, 1);

% Preallocate an internal audio recording  buffer with a capacity of 10 seconds:
PsychPortAudio('GetAudioData', pahandle, 10);

% Start audio capture immediately and wait for the capture to start.
% We set the number of 'repetitions' to zero,
% i.e. record until recording is manually stopped.
PsychPortAudio('Start', pahandle, 0, 0, 1);

% wait for mouse click
GetClicks();

% Fetch current audiodata:
audiodata = PsychPortAudio('GetAudioData', pahandle);

% Stop capture:
PsychPortAudio('Stop', pahandle);

% Close the audio device:
PsychPortAudio('Close', pahandle);

% write out the wav file
wavwrite(transpose(audiodata), 44100, 16, ['participants/' participantId '/audio/' wavFileName]);