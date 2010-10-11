% Displays image files 'imageFileNames' to destinationRects on the screen.
%
%  TOP LEFT CORNER OF SCREEN is x=0, y=0.
%
%  destRect = [0,0,maxX,maxY] would draw on the entire screen...
%
%  WARNING: This function is time consuming for large numbers of images.
%
% Author: Brian Armstrong
%
function displayMultipleImageDataAtDestRects(window, imagesData, destinationRects)
    % make sure the sizes match (same num of images as rows in
    % destinationRects
    arraySize = size(destinationRects);
    if (~length(imagesData) == arraySize(2))
        error('Must have same number of image data elements as columns in destinationRects to use this function.');
    end
    
    % the texture pointers
    myTextures = [];
    
    % for each imageFile, create textures
    for i=1:length(imagesData)
        % make texture image out of image matrix 'imdata'
        myTextures(i)=Screen('MakeTexture', window, imagesData{i});
    end
    
    % Draw texture images to backbuffer at locations destinationRects. 
    Screen('DrawTextures', window, myTextures, [],  destinationRects);

    % Show stimulus on screen at next possible display refresh cycle
    Screen('Flip', window);