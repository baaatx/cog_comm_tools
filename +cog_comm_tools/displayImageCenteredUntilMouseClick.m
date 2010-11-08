% Displays image file 'imageFileName' on the screen centered until a mouse
% click is read.
%
% window - the window pointer
%
% imageFileName - the name of a valid image file
%
%
% Author: Brian Armstrong
%
function displayImageCenteredUntilMouseClick(window, imageFileName)
    cog_comm_tools.displayImageCentered(window , imageFileName);

    % waits for mouse click(s)
    GetClicks();