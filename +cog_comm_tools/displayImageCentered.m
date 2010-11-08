% Wrapper that displays image file 'imageFileName' centered on the screen.
%
% window - the window pointer
%
% imageFileName - the name of a valid image file
%
%
% Author: Brian Armstrong
%
function displayImageCentered(window, imageFileName)
    cog_comm_tools.displayImageAtDestRect(window, imageFileName, []);