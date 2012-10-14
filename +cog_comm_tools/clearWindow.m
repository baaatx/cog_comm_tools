% Wrapper for blanking out the screen. (Fills the screen with the color
% which opposes the currently set text color.)
%
%
% window - the window pointer of the screen to blank out
%
%
% Author: Brian Armstrong
%
function clearWindow(window)
    % background color is opposite of the set textColor
    currentTextColor = cog_comm_tools.getCurrentTextColor(window);
    backgroundColor = cog_comm_tools.getColorComplement(currentTextColor);
    
    % fill and display the background color...
    cog_comm_tools.fillWindow(window, backgroundColor);
    cog_comm_tools.displayWindow(window);