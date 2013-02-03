% Function for starting an audio recording from the microphone to be
% stopped at a later time during the experiement.
%
% Returns the audio handle used to stop the audio recording at a later
% point -- along with the initially recorded audio and the responseTime.
%
%
%
% audioBufferLength = how long to record for
%
%
% voiceTrigger (optional) = the amplitude below which is considered to be
%                           silence. (between 0 and 1)
%
%
% Authors: Brian Armstrong, Dylan Bumford
%
function [portAudioHandle] = startRecordingAudioFromMicrophone(audioBufferLength, voiceTrigger)

% Open the default audio device [], with mode 2 (== Only audio capture),
% and a required latencyclass of zero 0 == no low-latency mode, as well as
% a frequency of 44100 Hz and 2 sound channels for stereo capture.
% This returns a handle to the audio device:
freq = 44100;
portAudioHandle = PsychPortAudio('Open', [], 2, 3, freq, 1);

% Preallocate an internal audio recording  buffer with a capacity of audioBufferLength seconds:
PsychPortAudio('GetAudioData', portAudioHandle, audioBufferLength);

% Start audio capture immediately and wait for the capture to start.
% We set the number of 'repetitions' to zero,
% i.e. record until recording is manually stopped.
PsychPortAudio('Start', portAudioHandle, 0, 0);
 
