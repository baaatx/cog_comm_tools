% Function that records audio from the microphone into a wavFile by
% participantId - waits until space key is pressed to stop, or records for 'maxRecordingLength' seconds.
%
% participantId   = participantId
%
% wavfilename = Name of a .wav sound file to store the recorded sound to.
%
% recordingLength = How long to record for.
%
% Authors: Brian Armstrong, Dylan Bumford
%
function recordAudioFromMicrophoneUntilSpaceKey(participantId, wavFileName, maxRecordingLength)
% set default max recording time to 10 seconds
if (nargin < 3)
    maxRecordingLength = 10.00;
end

startTime = GetSecs();
spaceKey = KbName('space');
dt = 0.1;

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

proceed = false;

while (proceed == false && (GetSecs() - startTime < maxRecordingLength))
    if (cog_comm_tools.checkForKeyPress(spaceKey))
        proceed = true;
    end
    WaitSecs(dt);
end

% Fetch current audiodata:
audiodata = PsychPortAudio('GetAudioData', pahandle);

% Stop capture:
PsychPortAudio('Stop', pahandle);

% Close the audio device:
PsychPortAudio('Close', pahandle);

% write out the wav file
wavwrite(transpose(audiodata), 44100, 16, ['participants/' participantId '/audio/' wavFileName]);