% Function that displays image file 'imageFileName' on the screen until the space key is
% pressed.
%
% window - the window pointer
%
% imageFileName - the name of a valid image file
%
%
% Author: Brian Armstrong
%
function displayImageCenteredUntilSpaceKey(window, imageFileName)
    cog_comm_tools.displayImageCentered(window, imageFileName);
    cog_comm_tools.waitUntilKeyPressed('space'); 