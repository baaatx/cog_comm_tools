% Wrapper for displaying text on the screen starting at position (x,y)
%
% window - the window pointer
%
% text - the text string to display
%
% x - the x position to draw to
%
% y - the y position to draw to
%
%
% Author: Brian Armstrong
%
function displayTextAtPosition(window, text, x, y)
    DrawFormattedText(window, text, x, y, 0);
    Screen('Flip', window);