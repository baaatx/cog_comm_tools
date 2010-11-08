% Wrapper for drawing text centered on the screen.
%
% window - the window pointer
%
% text - text string to display
%
%
% Author: Brian Armstrong
%
function drawTextCentered(window, text)
    DrawFormattedText(window, text, 'center', 'center', 0);    