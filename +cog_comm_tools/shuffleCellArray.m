% Randomly Shuffles the elements of a cell Array in place (constant space, linear time).
%
% cellArray - the cell array to shuffle (randomize order)
%
%
% Author: Brian Armstrong
%
function cellArray = shuffleCellArray(cellArray)
    for i=1:length(cellArray)
        % Get a new random position
        randomPos = randi(length(cellArray));
        % Swap position of element.
        temp = cellArray{i};
        cellArray{i} = cellArray{randomPos};
        cellArray{randomPos} = temp;
    end    