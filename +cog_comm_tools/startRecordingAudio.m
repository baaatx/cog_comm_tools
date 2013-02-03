%
% portAudioHandle = handle to start recording on
%
%
% voiceTrigger (optional) = the amplitude below which is considered to be
%                           silence. (between 0 and 1)
%
%
% Authors: Brian Armstrong
%
function [startTime] = startRecordingAudio(portAudioHandle)

% Start audio capture immediately and wait for the capture to start.
% We set the number of 'repetitions' to zero,
% i.e. record until recording is manually stopped.
startTime = PsychPortAudio('Start', portAudioHandle, 0, 0);
 
