% Function that breaks a text file into a cell array of data by a
% delimiter string.
%
% fileName - the name of the file
%
% delimiter - the delimiter string
%
%
% Author: Brian Armstrong
%
function cellArray = delimitedTextFileToStringArrays(filename, delimiter)
    % open file for reading
    fileHandle = cog_comm_tools.openFileForRead(filename);
    
    % first, break file into peices delimited by 'delimiter'
    delimitedArray = textscan(fileHandle, '%s', 'delimiter', delimiter, 'MultipleDelimsAsOne', 1, 'CollectOutput', 1);
    
    % return the results of the scan...
    cellArray = delimitedArray{1};