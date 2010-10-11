% Wrapper for displaying text centered on the screen with delay.
%
% Author: Brian Armstrong
%
function displayTextCenteredAndWait(window, text, displayTime)
    DrawFormattedText(window, text, 'center', 'center', 0);
    Screen('Flip', window);
    WaitSecs(displayTime);
