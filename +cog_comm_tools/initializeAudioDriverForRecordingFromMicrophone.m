% Function for initializing a audio handle for recording from the microphone to be
% started at a later time during the experiement.
%
% Returns the audio handle created for recording --  to start the recording at a later
% point.
%
%
%
% audioBufferLength = how long to record for
%
%
% Authors: Brian Armstrong
%
function [portAudioHandle] = initializeAudioDriverForRecordingFromMicrophone(audioBufferLength)

% Open the default audio device [], with mode 2 (== Only audio capture),
% and a required latencyclass of zero 0 == no low-latency mode, as well as
% a frequency of 44100 Hz and 2 sound channels for stereo capture.
% This returns a handle to the audio device:
freq = 44100;
portAudioHandle = PsychPortAudio('Open', [], 2, 0, freq, 1);

% Preallocate an internal audio recording  buffer with a capacity of audioBufferLength seconds:
PsychPortAudio('GetAudioData', portAudioHandle, audioBufferLength);
