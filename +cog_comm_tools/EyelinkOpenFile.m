% Wrapper for opening a file on the Eyelink Host machine to write to...
%
% fileName - a valid dos edf filename to open.
%
%
% Author: Brian Armstrong
%
function EyelinkOpenFile(fileName)
    % check that filename isn't too long...
    if (length(fileName)>12)
        error(['fileName: ' fileName ' is too long for ROM-DOS']);
    end
    
    % the open file command...
    Eyelink('OpenFile',fileName);