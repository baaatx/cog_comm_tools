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
% fontColor - (optional) a color vector... overrides the default font color
%
%
% Author: Brian Armstrong
%
function drawTextAtPosition(window, text, x, y, fontColor)

    % font color is optional, defaults to initializes textColor value...
    if (nargin < 5)
        fontColor = Screen('TextColor', window);
    end
    
    % use PTB function to draw the text...
    DrawFormattedText(window, text, x, y, fontColor);