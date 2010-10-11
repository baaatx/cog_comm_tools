% Display image data in 'imageStim' to window.
%
% Remember: TOP LEFT CORNER OF SCREEN is x=0, y=0.
%
% Author: Brian Armstrong
%
function displayImageStim(window, imageStim)
    cog_comm_tools.displayImageDataAtDestRect(window, imageStim.imageData, imageStim.destRect);