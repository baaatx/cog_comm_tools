% Opens a file in append mode, handling any I/O errors. Returns the file handle.
%
function fileHandle = openFileForAppend(filename)
    fileHandle = fopen(filename, 'at+');
    if fileHandle==-1
        error(['Could not open file for append: ' filename ]); 
    end
    
    