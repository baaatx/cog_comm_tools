% Opens a file in read and write mode, handling any I/O errors. Returns the file handle.
%
% fileName - the filename to use
%
%
% Author: Brian Armstrong
%
function fileHandle = openFileForReadAndWrite(fileName)
    fileHandle = fopen(fileName, 'r+');
    if fileHandle==-1
        error(['Could not open file for read and write: ' fileName ]); 
    end   