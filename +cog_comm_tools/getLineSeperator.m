% Plays a WAV file. Returns the fileTime (how long the played file is in seconds)
%
% wavFileName - the WAV file to play
%
%
% Author: Brian Armstrong
%
function lineSep = getLineSeperator()
    if (IsWindows())
        lineSep = [13 10];
    else
        lineSep = 10;
    end
    
    lineSep = char(lineSep);