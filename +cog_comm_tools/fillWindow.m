% Wrapper to fill the entire window with a single color.
%
% window - the window to flip (draw buffer to screen)
%
% color - color vector of the color to use to fill... Can be a RGB [red green blue] or
% single int value (grayscale).
%
%
% Author: Brian Armstrong
%
function fillWindow(window, color)
    
    % allow for RGB or int color values
    if (size(color, 2) ~= 3)
        % if int value, make an RGB value
        color = [color color color];
    end
    
    % the entire screen destRect
    destRect = Screen('Rect', window);

    % make a 1x1 image of color
    imageMatrix = zeros(1,1,3, 'uint8');
    imageMatrix(:,:,1) = color(1);
    imageMatrix(:,:,2) = color(2);
    imageMatrix(:,:,3) = color(3);
    
    % draw the imageData to the screen
    cog_comm_tools.drawImageDataAtDestRect(window, imageMatrix, destRect);