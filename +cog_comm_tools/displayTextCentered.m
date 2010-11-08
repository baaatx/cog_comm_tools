% Wrapper for displaying text centered on the screen.
%
% window - the window pointer
%
% text - the text string to display
%
%
% Author: Brian Armstrong
%
function displayTextCentered(window, text)
    DrawFormattedText(window, text, 'center', 'center', 0);
    Screen('Flip', window);