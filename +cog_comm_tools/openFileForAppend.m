% Opens a file in append mode, handling any I/O errors. Returns the file handle.
%
% fileName - the filename to use
%
%
% Author: Brian Armstrong
%
function fileHandle = openFileForAppend(fileName)
    fileHandle = fopen(fileName, 'at+');
    if fileHandle==-1
        error(['Could not open file for append: ' fileName ]); 
    end    