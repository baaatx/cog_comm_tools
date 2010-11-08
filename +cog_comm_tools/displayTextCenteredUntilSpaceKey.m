% Wrapper for displaying text centered on the screen until the space key is
% pressed on the keyboard.
%
% window - the window pointer
%
% text - the text string to display
%
%
% Author: Brian Armstrong
%
function displayTextCenteredUntilSpaceKey(window, text)
    DrawFormattedText(window, text, 'center', 'center', 0);
    Screen('Flip', window);
    cog_comm_tools.waitUntilKeyPressed('space');