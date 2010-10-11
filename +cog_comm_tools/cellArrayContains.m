% Checks the cell array of strings for a stringValue.
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