% Displays image files 'imageFileNames' to destinationRects on the screen.
%
%  TOP LEFT CORNER OF SCREEN is x=0, y=0.
%
%  destRect = [0,0,maxX,maxY] would draw on the entire screen...
%
%  WARNING: This function can be time consuming for large amount of image
%  data.
%
% Author: Brian Armstrong
%
function displayImagesAtDestRects(window, imageFileNames, destinationRects)
    % read stimulus image into matlab matrix 'imdata':

    % make sure the sizes match (same num of images as rows in
    % destinationRects
    arraySize = size(destinationRects);
    if (length(imageFileNames) ~= arraySize(2))
        error('Must have same number of image files as columns in destinationRects to use this function.');
    end
    
    % the texture pointers
    myTextures = [];
    
    % for each imageFile, create textures
    for i=1:length(imageFileNames)
        imdata = imread(char(imageFileNames(i)));
        % make texture image out of image matrix 'imdata'
        myTextures(i)=Screen('MakeTexture', window, imdata);
    end
    
    % Draw texture images to backbuffer at locations destinationRects. 
    Screen('DrawTextures', window, myTextures, [],  destinationRects);

    % Show stimulus on screen at next possible display refresh cycle
    Screen('Flip', window);