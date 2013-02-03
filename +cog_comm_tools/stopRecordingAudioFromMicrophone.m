% Function for stopping a previously start audio recording from the
% microphone. 
%
% portAudioHandle - audio capture handle returned previously by
% startRecordingAudioFromMicrophone.
%
% recordedAudio - the initial audio captured and returned by the start method
%
% fileName - name of the file to be saved.
%
%
% Authors: Brian Armstrong
%
function responseTime = stopRecordingAudioFromMicrophone(portAudioHandle, participantId, sessionId, fileName, voiceTrigger)

% voiceTrigger is optional
if (nargin < 5)
    voiceTrigger = .01;
end

% Stop capture
PsychPortAudio('Stop', portAudioHandle);

% last fetch operation to get remaining data from the capture engine
audiodata = PsychPortAudio('GetAudioData', portAudioHandle);

% Close the audio device
PsychPortAudio('Close', portAudioHandle);

%audioDataCopy = audiodata;

% construct the output filename
outputFileName = ['participants' filesep participantId filesep sessionId filesep 'audio' filesep fileName '.wav'];

%disp(['outputFileName:' outputFileName]);

% Store recorded sound to wavfile
wavwrite(transpose(audiodata), 44100, 16, outputFileName);

%numberOfSamplesCaptured = length(audioDataCopy);

%level of the sample
%level = 0;
%endSlicePosition = 10;
%delta = 1;

% Repeat as long as below trigger-threshold:
%while (level < voiceTrigger && endSlicePosition < numberOfSamplesCaptured)
    % next sample

    % Compute maximum signal amplitude in this slice of data:
%    if ~isempty(audiodata)
%        level = max(abs(audioDataCopy(1,endSlicePosition)));
%    else
%        level = 0;
%    end

%    endSlicePosition = endSlicePosition + delta;
%end

%calculate response time based on 44100 sample rate
%responseTime = (1 / 44100) * endSlicePosition;

% TODO response time isn't being returned
responseTime = -1;