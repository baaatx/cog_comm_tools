% Wrapper for displaying text on the screen starting at position (x,y)
%
% Author: Brian Armstrong
%
function displayTextAtPosition(window, text, x, y)
    DrawFormattedText(window, text, x, y, 0);
    Screen('Flip', window);   
