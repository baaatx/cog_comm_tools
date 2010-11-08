% Wrapper for blanking out the screen.
%
% window - the window pointer of the screen to blank out
%
%
% Author: Brian Armstrong
%
function clearWindow(window)
    cog_comm_tools.displayTextCentered(window, ' ');