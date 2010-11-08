% Displays image file 'imageFileName' centered on the screen for 'delay' seconds.
%
% window - the window pointer
%
% imageFileName - the image file to display
%
% delay - the amount of time to wait before continuing
%
%
% Author: Brian Armstrong
%
function displayImageCenteredAndWait(window, imageFileName, delay)
    cog_comm_tools.displayImageCentered(window , imageFileName);
    WaitSecs(delay);