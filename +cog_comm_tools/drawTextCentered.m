% Wrapper for drawing text centered on the screen.
%
% window - the window pointer
%
% text - text string to display
%
% fontColor - (optional) RGB font color to use...
%
%
% Author: Brian Armstrong
%
function drawTextCentered(window, text, fontColor)
    
    % use default font color if no argument is passed...
    if (nargin < 3)
        fontColor = Screen('TextColor', window);
    end
        
    cog_comm_tools.drawTextAtPosition(window, text, 'center', 'center', fontColor);