% Checks to see if the click coordinates are in a range of rect
%
% Author: Brian Armstrong
%
function inRange = checkClickIsInRange(rect, clickX, clickY)
    inRange = false;
    if (clickX>=rect(1) && clickX<=rect(3) && clickY>=rect(2) && clickY<=rect(4))
        inRange = true;
    end