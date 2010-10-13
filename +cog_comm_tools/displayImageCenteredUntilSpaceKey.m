% Function that displays image file 'imageFileName' on the screen until the space key is
% pressed.
%
% Author: Brian Armstrong
%
function displayImageCenteredUntilSpaceKey(window, imageFileName)
    cog_comm_tools.displayImageCentered(window, imageFileName);
    cog_comm_tools.waitUntilKeyPressed('space'); 