% Randomly Shuffles the elements of an Array in place (constant space, linear time).
%
% array - the array (vector) to shuffle (randomize order)
%
%
% Author: Brian Armstrong
%
function array = shuffleArray(array)
    for i=1:length(array)
        % Get a new random position
        randomPos = randi(length(array));
        % Swap position of element.
        temp = array(i);
        array(i) = array(randomPos);
        array(randomPos) = temp;
    end    