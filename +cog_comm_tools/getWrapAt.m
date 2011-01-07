% Wrapper that determines the number of characters a string should be
% wrapped at for the window based on fontSize and screen resolution...
%
% window - the window pointer...
%
%
% Author: Brian Armstrong
%
function wrapAt = getWrapAt(window)
    fontSize = Screen('TextSize', window);
    screenRect = Screen('Rect', window);
    width = screenRect(3);
    wrapAt = round(width / (0.70 * fontSize));