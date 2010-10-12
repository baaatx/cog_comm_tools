% Draws image data in 'imageStim' to window  BUT DOES NOT FLIP SCREEN.
%
% Note: The imageStim is drawn to its own destRect (its position is
% encapsulated)
%
% Remember: TOP LEFT CORNER OF SCREEN is x=0, y=0.
%
% Author: Brian Armstrong
%
function drawImageStim(window, imageStim)
    cog_comm_tools.drawImageDataAtDestRect(window, imageStim.imageData, imageStim.destRect);