% Draws image data in 'imageStim' to window  BUT DOES NOT FLIP SCREEN.
%
% window - the window pointer
%
% imageStim - an imageStim object
%
%
% NOTE: The imageStim is drawn to its own destRect (its position is
% encapsulated)
%
%
% Author: Brian Armstrong
%
function drawImageStim(window, imageStim)
    cog_comm_tools.drawImageDataAtDestRect(window, imageStim.imageData, imageStim.destRect);