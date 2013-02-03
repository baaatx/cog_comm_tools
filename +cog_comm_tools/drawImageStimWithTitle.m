% Draws image data in 'imageStim' to window with it's title centered.
%
% window - the window pointer
%
% imageStim - an imageStim object
%
%
% Author: Brian Armstrong
%
function myTexture = drawImageStimWithTitle(window, imageStim)

    % get font size for window
    fontSize = cog_comm_tools.getCurrentTextSize(window);
    
    % draw the image stim data to the screen...
    myTexture = cog_comm_tools.drawImageDataAtDestRect(window, imageStim.imageData, imageStim.destRect);
    
    % draw the title under the image (approx centered)
    xOffset = ((fontSize/2) * round(length(imageStim.title) / 2));
    cog_comm_tools.drawTextAtPosition(window, imageStim.title, (imageStim.xPos - xOffset), imageStim.yPos + (imageStim.height/2) + 2);