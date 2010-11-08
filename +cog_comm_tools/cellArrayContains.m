% Checks the cell array of strings for a stringValue.
%
% cellArray - a cell array of Strings
%
% stringValue - the string to check for
%
%
% Author: Brian Armstrong
%
function contains = cellArrayContains(cellArray, stringValue)

contains = false;

for i=1:length(cellArray)
    if (strcmp(cellArray{i}, stringValue));
        contains = true;
    end
end