% Displays image file 'imageFileName' centered on the screen for 'delay' seconds.
%
% Author: Brian Armstrong
%
function displayImageCenteredAndWait(window, imageFileName, delay)
    cog_comm_tools.displayImageCentered(window , imageFileName);
    WaitSecs(delay);