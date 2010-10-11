% Wrapper for drawing text centered on the screen.
%
% Author: Brian Armstrong
%
function drawTextCentered(window, text)
    DrawFormattedText(window, text, 'center', 'center', 0);    