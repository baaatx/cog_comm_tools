% Displays image file 'imageFileName' centered on the screen for 'imageDisplayTime' seconds.
%
% window - the window pointer
%
% imageData - the extracted image data from an image file
%
% imageDisplayTime - the amount of time to wait before continuing
%
%
% Author: Brian Armstrong
%
function displayImageDataCenteredAndWait(window, imageData, imageDisplayTime)
    cog_comm_tools.displayImageDataCentered(window, imageData);
    WaitSecs(imageDisplayTime);