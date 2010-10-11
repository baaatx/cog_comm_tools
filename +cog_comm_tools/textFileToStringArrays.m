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

function stringArray = textFileToStringArrays(filename, linesPerArray)
    
    % open file for reading
    fileHandle = cog_comm_tools.openFileForReading(filename);
    
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