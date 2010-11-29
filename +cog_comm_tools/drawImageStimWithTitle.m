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

    % get font size for window
    fontSize = Screen('TextSize', window);

    % draw the image stim data to the screen...
    cog_comm_tools.drawImageDataAtDestRect(window, imageStim.imageData, imageStim.destRect);

    % draw the title under the image (approx centered)
    xOffset = ((fontSize/2) * round(length(imageStim.title) / 2));
    DrawFormattedText(window, imageStim.title, (imageStim.xPos - xOffset), (imageStim.yPos + imageStim.height/2), 0);