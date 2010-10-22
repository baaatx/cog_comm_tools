% Displays image data in 'imageStim' to window with it's title centered. 
%
% Author: Brian Armstrong
%
function displayImageStimWithTitle(window, imageStim)
    cog_comm_tools.drawImageDataAtDestRect(window, imageStim.imageData, imageStim.destRect);
    DrawFormattedText(window, imageStim.title, (imageStim.xPos - imageStim.width/4), (imageStim.yPos + imageStim.height/2), 0);
    Screen('Flip', window);