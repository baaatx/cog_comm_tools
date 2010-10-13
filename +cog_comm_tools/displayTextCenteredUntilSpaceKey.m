% Wrapper for displaying text centered on the screen with delay.
%
% Author: Brian Armstrong
%
function displayTextCenteredUntilSpaceKey(window, text)
    DrawFormattedText(window, text, 'center', 'center', 0);
    Screen('Flip', window);
    cog_comm_tools.waitUntilKeyPressed('space');