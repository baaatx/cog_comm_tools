% Draws image data in 'imageStim' to window with it's title centered.
%
% window - the window pointer
%
% imageStim - an imageStim object
%
%
% Author: Brian Armstrong
%
function drawImageStimWithTitle(window, imageStim)
    cog_comm_tools.drawImageDataAtDestRect(window, imageStim.imageData, imageStim.destRect);
    DrawFormattedText(window, imageStim.title, (imageStim.xPos - imageStim.width/4), (imageStim.yPos + imageStim.height/2), 0);