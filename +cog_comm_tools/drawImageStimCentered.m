% Draws image data in 'imageStim' to window centered.
%
% window - the window pointer
%
% imageStim - an imageStim object
%
%
%
% Author: Brian Armstrong
%
function myTexture = drawImageStimCentered(window, imageStim)
    myTexture = cog_comm_tools.drawImageDataAtDestRect(window, imageStim.imageData, []);