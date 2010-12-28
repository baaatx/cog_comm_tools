% Displays image data 'imageData' on the screen to the destRect
% destinationRect.
%
% window - the window pointer
%
% imageData - the extracted data from an image
%
% destinationRect - the destRect to display to
%
% NOTE:  destRect = [0,0,maxX,maxY] would draw on the entire screen...
%
%
% Author: Brian Armstrong
%
function displayImageDataAtDestRect(window, imageData, destinationRect)
    % make texture image out of image matrix 'imdata'
    myTexture=Screen('MakeTexture', window, imageData);

    % Draw texture image to backbuffer. It will be automatically
    % centered in the middle of the display if you don't specify a
    % different destination:
    
    Screen('DrawTexture', window, myTexture, [],  destinationRect);

    % Show stimulus on screen at next possible display refresh cycle
    Screen('Flip', window);