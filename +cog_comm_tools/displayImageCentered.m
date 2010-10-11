% Wrapper that Displays image file 'imageFileName' centered on the screen.
%
% (just calls with empty destRect)
%
% Author: Brian Armstrong
%
function displayImageCentered(window, imageFileName)
    cog_comm_tools.displayImageAtDestRect(window, imageFileName, []);