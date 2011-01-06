% Wrapper to fade the screen from black to white.
%
% window - the window pointer
%
%
% Author: Brian Armstrong
%
function fadeBlackToWhite(window)
    % cycle through grayscale colors, black first
    for i=1:255
        cog_comm_tools.fillWindow(window,i);
        cog_comm_tools.displayWindow(window);
    end