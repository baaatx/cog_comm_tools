% Plays a WAV file. Returns the fileTime (how long the played file is in seconds)
%
% wavFileName - the WAV file to play
%
%
% Author: Brian Armstrong
%
function fileTime = playWav(wavFileName)
    % grab the wav data
    [y,fs] = wavread(wavFileName);
    
    % play the sound
    fileTime = (length(y))/fs;
    sound (y, fs);