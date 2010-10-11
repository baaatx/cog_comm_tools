% Wrapper for drawing text on the screen starting at position (x,y)
%
% Author: Brian Armstrong
%
function drawTextAtPosition(window, text, x, y)
    DrawFormattedText(window, text, x, y, 0);
    
