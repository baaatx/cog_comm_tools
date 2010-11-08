% Checks to see if the click coordinates are in a range of rect
%
% rect - the 'destRect' style rectangular sub-section of the screen to
% check for [X1 Y1 X2 Y2].
%
% clickX - the x coordinate of the click to check
%
% clickY - the y coordinate of the click to check
%
%
% Author: Brian Armstrong
%
function inRange = checkClickIsInRange(rect, clickX, clickY)
    inRange = false;
    if (clickX>=rect(1) && clickX<=rect(3) && clickY>=rect(2) && clickY<=rect(4))
        inRange = true;
    end