% Displays image file 'imageFileName' centered on the screen.
%
% window - the window pointer
%
% imageData - the extracted data from an image file
%
%
% Author: Brian Armstrong
%
function displayImageDataCentered(window, imageData)
    cog_comm_tools.displayImageDataAtDestRect(window, imageData, []);