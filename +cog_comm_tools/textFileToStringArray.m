% Takes a line delimted text file and returns an array of strings (one for each line).
function stringArray = textFileToStringArray(filename)
    
    fileHandle = cog_comm_tools.openFileForRead(filename);
    
    stringArray = textscan(fileHandle, '%s', 'delimiter', '\n', 'whitespace', '');
    
    % return the array we want
    stringArray = stringArray{1}; 
    