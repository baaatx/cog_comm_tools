% Wrapper for displaying text centered on the screen with delay.
%
% window - the window pointer
%
% text - the text string to display
%
% displayTime - the amount of time to display for before continuing.
%
%
% Author: Brian Armstrong
%
function displayTextCenteredAndWait(window, text, displayTime)
    DrawFormattedText(window, text, 'center', 'center', 0);
    Screen('Flip', window);
    WaitSecs(displayTime);
