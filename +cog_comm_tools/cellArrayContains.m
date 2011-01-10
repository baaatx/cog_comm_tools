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

% the return flag
contains = false;

% look at each element of the array and compare...
for i=1:length(cellArray)
    if (strcmp(cellArray{i}, stringValue));
        contains = true;
        break;
    end
end