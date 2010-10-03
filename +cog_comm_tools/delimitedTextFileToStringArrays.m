% A function that takes a text file and returns an array of arrays of strings each
% linesPerArray long.
% 
% Used to break a carriage return delimited txt file into blocks.
%
% Example Usage:
% %Get file 4linesperblock loaded into a N x 4 cell array where N
% %is the number of lines in the file.
% strArr = textFileToStringArrays('stimuli/text/4linesperblock.txt', 4);
% 
% %display the first block of 4 lines (an array)
% disp(strArr{1});
% %display the first line of the first block (a string)
% disp(strArr{1}{1});
%
% Author: Brian Armstrong

function returnedMap = delimitedTextFileToStringArrays(filename, delimiter)
    
    % open file for reading
    fileHandle = cog_comm_tools.openFileForRead(filename);
    
    % first, break file into peices delimited by 'delimeter'
    delimitedArray = textscan(fileHandle, '%s', 'delimiter', delimiter, 'MultipleDelimsAsOne', 1, 'CollectOutput', 1);
    
    returnedMap = delimitedArray{1};