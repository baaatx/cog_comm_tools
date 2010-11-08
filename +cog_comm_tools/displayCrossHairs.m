% Wrapper that Displays cross hairs at (xPos,yPos).
%
% window - the window pointer
%
% xPos - x position to display at
%
% yPos - y position to display at
%
%
% Author: Brian Armstrong
%
function displayCrossHairs(window, xPos, yPos)
    ch = cog_comm_tools.ImageStim('ch', 'stimuli/images/cross_hairs.jpg', xPos, yPos, 'CrossHairs');
    cog_comm_tools.displayImageStim(window, ch);