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

    % default background color is opposing font color...
    backgroundColor = cog_comm_tools.getColorComplement(fontColor);
    
    cog_comm_tools.displayTextAtPosition(window, text, 'center', 'center', backgroundColor, fontColor);    