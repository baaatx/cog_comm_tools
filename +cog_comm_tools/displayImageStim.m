% Display image data in 'imageStim' to window.
%
% window - the window pointer
%
% imageStim - an imageStim object
%
%
% Author: Brian Armstrong
%
function displayImageStim(window, imageStim)
    cog_comm_tools.displayImageDataAtDestRect(window, imageStim.imageData, imageStim.destRect);