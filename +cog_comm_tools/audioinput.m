function responseTime = audioinput(sid, line, voicetrigger, startsecs, recordingLength)
% 
% This is an archived audio recording function used in the SlipSol
% experiment.
%
% Parameters:
%
% sid         = Subject ID - a string.
%
% wavfilename = Name of a .wav sound file to store the recorded sound to.
%               If left out, sound won't be stored to filesystem.
% 
% voicetrigger = If set to a non-zero threshold value, the driver will wait
%                for the sound signal to exceed the specified voicetrigger threshold
%                level before it starts capturing audio data.
%
% startsecs    = Maximum number of seconds of sound to capture. Defaults to
%                infinite - sound is recorded until a key is pressed.

% AssertOpenGL;

if nargin < 3
    voicetrigger = .01;
end

if nargin < 4
    startsecs = GetSecs();
end

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

level = 0;
recordedaudio = [];  
% Repeat as long as below trigger-threshold:
while (level < voicetrigger && (GetSecs() - startsecs) < .8)
    % Fetch current audiodata:
    audiodata = PsychPortAudio('GetAudioData', pahandle);

    % Compute maximum signal amplitude in this chunk of data:
    if ~isempty(audiodata)
        level = max(abs(audiodata(1,:)));
    else
        level = 0;
    end
        
    % Below trigger-threshold?
    if level < voicetrigger
        % Wait for a millisecond before next scan:
        WaitSecs(0.0001);
    end
    recordedaudio = [recordedaudio audiodata];
end

% If past one second with no response, beep
responseTime = (GetSecs() - startsecs);

% Should wait until finished speaking, but for now just wait a while
WaitSecs(recordingLength-(GetSecs()-startsecs));

% Stop capture:
PsychPortAudio('Stop', pahandle);

% Perform a last fetch operation to get all remaining data from the capture engine:
audiodata = PsychPortAudio('GetAudioData', pahandle);

recordedaudio = [recordedaudio audiodata];

% Close the audio device:
PsychPortAudio('Close', pahandle);

if isempty(strfind(line, 'Fi'))
    % Store recorded sound to wavfile?
    wavwrite(transpose(recordedaudio), 44100, 16, ['subjects' '/' sid '/' 'audio' '/' line '.wav']);
end
