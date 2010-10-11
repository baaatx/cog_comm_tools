% Displays image file 'imageFileName' centered on the screen for 'imageDisplayTime' seconds.
%
function displayImageDataCenteredAndWait(window, imageData, imageDisplayTime)
    cog_comm_tools.displayImageDataCentered(window, imageData);
    WaitSecs(imageDisplayTime);