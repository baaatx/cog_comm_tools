% Wrapper that Displays cross hairs at (xPos,yPos).
%
% Author: Brian Armstrong
%
function displayCrossHairs(window, xPos, yPos)
    ch = cog_comm_tools.ImageStim('ch', 'stimuli/images/cross_hairs.jpg', xPos, yPos, 'CrossHairs');
    cog_comm_tools.displayImageStim(window, ch);