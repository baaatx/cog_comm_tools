% Wrapper for displaying text centered on the screen.
%
% window - the window pointer
%
% text - the text string to display
%
% fontColor - the RGB color to use for the text...
%
% Author: Brian Armstrong
%
function displayTextCentered(window, text, fontColor)

    % font color is optional, defaults to the initialized color value...
    if (nargin < 3)
        fontColor = Screen('TextColor', window);
    end

    cog_comm_tools.drawTextCentered(window, text, fontColor);
    cog_comm_tools.displayWindow(window);