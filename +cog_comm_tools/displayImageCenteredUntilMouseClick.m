% Displays image file 'imageFileName' on the screen centered until a mouse
% click is read.
%
% Author: Brian Armstrong
%
function displayImageCenteredUntilMouseClick(window, imageFileName)
    cog_comm_tools.displayImageCentered(window , imageFileName);

    % waits for mouse click(s)
    GetClicks();