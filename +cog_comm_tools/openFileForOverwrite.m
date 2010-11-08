% Opens a file in overwrite mode, handling any I/O errors. Returns the file handle.
%
% fileName - the filename to use
%
%
% Author: Brian Armstrong
%
function fileHandle = openFileForOverwrite(fileName)
    fileHandle = fopen(fileName, 'w');
    if fileHandle==-1
        error(['Could not open file for overwrite: ' fileName ]); 
    end   