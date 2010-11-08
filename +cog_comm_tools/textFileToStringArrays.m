% A function that takes a text file and returns an array of arrays of strings each
% linesPerArray long. Use to break a carriage return delimited txt file into blocks.
%
% fileName - input text file name
%
% linesPerArray - how many lines to add to each sub-array
%
%
% Author: Brian Armstrong
%
function stringArray = textFileToStringArrays(fileName, linesPerArray)
    
    % open file for reading
    fileHandle = cog_comm_tools.openFileForRead(fileName);
    
    % first, count total lines in the file by using textscan
    arrSize = textscan(fileHandle, '%s', 'delimiter', '\n', 'whitespace', '');
    numLines = length(arrSize{1});
    
    % determine number of arrays
    numArrays = (numLines / linesPerArray);
    
    % initialize the new array
    stringArray = cell(numArrays);
    
    % rewind file handle to begining of file.
    frewind(fileHandle);
    
    % process each block of the file
    block=1;
    while (~feof(fileHandle))
        % Read linesPerArray strings delimited by a carriage returns into
        % an array of arrays.
        InputText=textscan(fileHandle,'%s',linesPerArray,'delimiter','\n');
        % Set this array as the return value.
        stringArray{block}= InputText{1};
        block=block+1;
    end   