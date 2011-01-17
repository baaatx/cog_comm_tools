% Displays image stims 'imageStims' to destinationRects on the screen.
%
% window - the window pointer
%
% imageStims - an array of imageStim objects
%
% destinationRects - the columns of destRects to which imageStims should be
% drawn.
%
% WARNING: This function is time consuming for large numbers of images.
%
%
% Author: Brian Armstrong
%
function displayImageStimsAtDestRects(window, imageStims, destinationRects)
    % make sure the sizes match (same num of images as rows in
    % destinationRects
    arraySize = size(destinationRects);
    if (~length(imageStims) == arraySize(2))
        error('Must have same number of image data elements as columns in destinationRects to use this function.');
    end
    
    % the texture pointers
    myTextures = zeros(1, length(imageStims));
        
    % for each imageFile, create textures
    for i=1:length(imageStims)
        % make texture image out of image matrix 'imdata'
        myTextures(i)=Screen('MakeTexture', window, imageStims(i).imageData);
    end
    
    %  fit each image stim into each grid cell without warping
    for i=1:length(imageStims)
        tmpDestRect = [imageStims(i).destRect(1); imageStims(i).destRect(2); imageStims(i).destRect(3); imageStims(i).destRect(4) ];
        destinationRects(:,i) = cog_comm_tools.fitDestRectCol(destinationRects(:,i), tmpDestRect);
    end
        
    % Draw texture images to backbuffer at locations destinationRects.
    Screen('DrawTextures', window, myTextures, [],  destinationRects);

    % Show stimulus on screen at next possible display refresh cycle
    cog_comm_tools.displayWindow(window);