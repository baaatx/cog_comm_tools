% Allows display of an ImageStim object at an arbitrary position on the
% screen. This function returns the destRect used for displaying the image at that
% position.
%
%
% Display image data in 'imageStim' to window at position (xPos , yPos).
% 
% window - the window pointer
%
% imageStim - an imageStim object
%
%
% Author: Brian Armstrong
%
function destRect = displayImageStimAtPosition(window, imageStim, xPos, yPos)
    
    % calculate coordinates for destRect
    minX = (xPos - (imageStim.width / 2));
    minY = (yPos - (imageStim.height / 2));
    maxX = (xPos + (imageStim.width / 2));
    maxY = (yPos + (imageStim.height / 2));
    
    % create destRect row
    destRect = [minX minY maxX maxY];

    % display Image data with custom destRect
    cog_comm_tools.displayImageDataAtDestRect(window, imageStim.imageData, destRect);