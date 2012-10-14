% Wrapper for displaying text centered on the screen until the space key is
% pressed on the keyboard.
%
% window - the window pointer
%
% text - the text string to display
%
% fontColor - (optional) the RGB color to use for the font
%
%
% Author: Brian Armstrong
%
function displayTextCenteredUntilSpaceKey(window, text, fontColor)
    
    % font color is optional, defaults to the initialized color value...
    if (nargin < 3)
        currentTextColor = cog_comm_tools.getCurrentTextColor(window);
        fontColor = currentTextColor;
    end

    cog_comm_tools.drawTextCentered(window, text, fontColor);
    cog_comm_tools.displayWindow(window);
    cog_comm_tools.waitUntilKeyPressed('space');