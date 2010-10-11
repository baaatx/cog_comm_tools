% Draws image data in 'imageStim' to window with it's title centered. BUT DOES NOT FLIP SCREEN.
%
% Remember: TOP LEFT CORNER OF SCREEN is x=0, y=0.
%
% Author: Brian Armstrong
%
function drawImageStimWithTitle(window, imageStim)
    cog_comm_tools.drawImageDataAtDestRect(window, imageStim.imageData, imageStim.destRect);
    DrawFormattedText(window, imageStim.title, (imageStim.xPos - imageStim.width/4), (imageStim.yPos + imageStim.height/2), 0);