% Wrapper for displaying text centered on the screen with delay.
%
% window - the window pointer
%
% text - the text string to display
%
% displayTime - the amount of time to display for before continuing.
%
% fontColor - (optional) the RGB color to use for the font
%
% Author: Brian Armstrong
%
function displayTextCenteredAndWait(window, text, displayTime, fontColor)
    
    % font color is optional, defaults to the initialized color value...
    if (nargin < 4)
        fontColor = Screen('TextColor', window);
    end    

    cog_comm_tools.displayTextCentered(window, text, fontColor);
    
    WaitSecs(displayTime);
