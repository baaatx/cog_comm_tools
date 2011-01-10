% Wrapper for displaying text on the screen starting at position (x,y)
%
% window - the window pointer
%
% text - the text string to display
%
% x - the x position to draw to
%
% y - the y position to draw to
%
% backgroundColor - (optional) background color (single int or RGB)
%
% fontColor - (optional) font color (single int for grayscale or an RGB [red green blue] value) 
%
% wrapAt - (optional) the number of characters to wrap into a new line.
%
% vSpacing - (optional) the vertical spacing between lines
%
%
% Author: Brian Armstrong
%
function displayTextAtPosition(window, text, x, y, backgroundColor, fontColor, wrapAt, vSpacing)

   % if a background color is passed in, fill the background before
    % drawing text...
    if (nargin > 4)
        cog_comm_tools.fillWindow(window, backgroundColor);
    end

    % font color is optional, defaults to the initialized color value...
    if (nargin < 6)
        fontColor = Screen('TextColor', window);
    end
    
    % wrap at (break into newlines) is optional
    if (nargin < 7)
        wrapAt = cog_comm_tools.getWrapAt(window);
    end
    
    % vertical spacing is optional 
    if (nargin < 8)
        vSpacing = 1.5;
    end

    % draw the text to the screen...
    cog_comm_tools.drawTextAtPosition(window, text, x, y, fontColor, wrapAt, vSpacing)
    
    % display the screen's buffer
    cog_comm_tools.displayWindow(window);