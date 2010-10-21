% Wrapper for displaying text centered on the screen.
%
% Author: Brian Armstrong
%
function displayTextCentered(window, text)
    DrawFormattedText(window, text, 'center', 'center', 0);
    Screen('Flip', window);