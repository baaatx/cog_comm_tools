% Wrapper to fade the screen from white to black.
%
% window - the window to flip (draw buffer to screen)
%
%
% Author: Brian Armstrong
%
function fadeWhiteToBlack(window)
    % cycle through grayscale colors, white first
    for i=225:-1:1
        cog_comm_tools.fillWindow(window,i);
        cog_comm_tools.displayWindow(window);
    end