% Wrapper for drawing text on the screen starting at position (x,y)
%
% window - the window pointer
%
% text - the text string to display
%
% x - the x position to display to
%
% y - the y position to display to
%
%
% Author: Brian Armstrong
%
function drawTextAtPosition(window, text, x, y)
    DrawFormattedText(window, text, x, y, 0);