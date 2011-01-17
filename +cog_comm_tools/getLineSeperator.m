% Gets (returns) the text file line seperator for this operating system.
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