% Opens a file in read only mode, handling any I/O error. Returns the file handle.
%
function fileHandle = openFileForRead(filename)
    fileHandle = fopen(filename, 'rt');
    if fileHandle==-1
        error(['Could not open file: ' filename ]); 
    end
    
    