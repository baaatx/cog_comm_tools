% Function that flashes a string 'str' on the screen for 'delay' seconds.
% There is a pause of 'blankDelay' seconds before and after the string is
% displayed.
%
% window - the window pointer
% str    - the string to display
% displayDelay - How long to display the string.
% blankDelay   - How long to show a blank screen before and after
% displaying the string.

function flashStringOnScreen(window, str , displayDelay, blankDelay)
    cog_comm_tools.displayTextCenteredAndWait(window, '', blankDelay);
    cog_comm_tools.displayTextCenteredAndWait(window, str, displayDelay);
    cog_comm_tools.displayTextCenteredAndWait(window, '', blankDelay);