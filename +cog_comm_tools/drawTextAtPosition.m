% Wrapper for drawing text on the screen starting at position (x,y)
%
% window - the window pointer
%
% text - the text string to display
%
% x - the x position to display to
%
% y - the y position to display to
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
function drawTextAtPosition(window, text, x, y, fontColor, wrapAt, vSpacing)

    % save old font color...
    oldFontColor = Screen('TextColor', window);

    % font color is optional, defaults to the initialized color value...
    if (nargin < 5)
        fontColor = Screen('TextColor', window);
    end
    
    % wrap at (break into newlines) is optional
    if (nargin < 6)
        wrapAt = cog_comm_tools.getWrapAt(window);
    end
    
    % vertical Spacking is optional 
    if (nargin < 7)
        vSpacing = 1.5;
    end
            
    % draw the text to the screen...
    DrawFormattedText(window, text, x, y, fontColor, wrapAt, [], [], vSpacing);
    
    % reapply the old font color...
    Screen('TextColor', window, oldFontColor);