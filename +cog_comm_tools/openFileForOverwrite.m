% Opens a file in overwrite mode, handling any I/O errors. Returns the file handle.
%
function fileHandle = openFileForOverwrite(filename)
    fileHandle = fopen(filename, 'w');
    if fileHandle==-1
        error(['Could not open file for overwrite: ' filename ]); 
    end   