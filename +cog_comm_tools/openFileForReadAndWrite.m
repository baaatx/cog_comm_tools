% Opens a file in read and write mode, handling any I/O errors. Returns the file handle.
%
function fileHandle = openFileForReadAndWrite(filename)
    fileHandle = fopen(filename, 'w+');
    if fileHandle==-1
        error(['Could not open file for read and write: ' filename ]); 
    end   