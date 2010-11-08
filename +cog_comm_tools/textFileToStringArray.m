% Takes a line delimted text file and returns an array of strings (one for each line).
%
% fileName - input file to scan
%
%
% Author: Brian Armstrong
%
function stringArray = textFileToStringArray(fileName)
    % open the file for scanning 
    fileHandle = cog_comm_tools.openFileForRead(fileName);
    
    % called textScan to return results
    stringArray = textscan(fileHandle, '%s', 'delimiter', '\n', 'whitespace', '');
    
    % return the array we want
    stringArray = stringArray{1};     