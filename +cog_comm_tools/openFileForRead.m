% Opens a file in read only mode, handling any I/O error. Returns the file handle.
%
% fileName - the filename to use
%
%
% Author: Brian Armstrong
%
function fileHandle = openFileForRead(fileName)
    fileHandle = fopen(fileName, 'r');
    if fileHandle==-1
        error(['Could not open file: ' fileName ]); 
    end
    
    