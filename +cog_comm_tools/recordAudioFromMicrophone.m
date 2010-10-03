% Function that records audio from the microphone into a wavFile by
% participantId.
%
% No special checks. Use this function for recording for a predetermined
% amount of time.
%
% Author: Brian Armstrong

function recordAudioFromMicrophone(participantId, wavFileName, recordingLength)
%
% Parameters:
%
% participantId   = participant's unique id
%
% wavfilename = Name of a .wav sound file to store the recorded sound to.
%
% recordingLength = How long to record for.
%
% AssertOpenGL; - Performed in initializeExperiment();
%
% Authors: Brian Armstrong, Dylan Bumford
%
startsecs = GetSecs();

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

% TODO pre-allocate enough space in memory for the audio data, fill with zeros.
recordedaudio = [];

% Repeat until recordingLength length
while ((GetSecs() - startsecs) < recordingLength)
    % Fetch current audiodata:
    audiodata = PsychPortAudio('GetAudioData', pahandle);
    recordedaudio = [recordedaudio audiodata];
end

% Should wait until finished speaking, but for now just wait a while
WaitSecs(recordingLength-(GetSecs()-startsecs));

% Stop capture:
PsychPortAudio('Stop', pahandle);

% Perform a last fetch operation to get all remaining data from the capture engine:
audiodata = PsychPortAudio('GetAudioData', pahandle);
recordedaudio = [recordedaudio audiodata];

% Close the audio device:
PsychPortAudio('Close', pahandle);

% write out the wav file
wavwrite(transpose(recordedaudio), 44100, 16, ['participants/' participantId '/audio/' wavFileName]);