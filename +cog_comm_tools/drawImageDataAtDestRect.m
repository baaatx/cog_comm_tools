% Draws image data 'imageData' on the screen at position
% destinationRect. BUT DOES NOT FLIP SCREEN.
%
% window - the window pointer
%
% imageData - the extracted image data for an image file
%
% destinationRect - the destRect to draw to.
%
% 
% Author: Brian Armstrong
%
function myTexture = drawImageDataAtDestRect(window, imageData, destinationRect)
    % make texture image out of image matrix 'imageData'
    myTexture=Screen('MakeTexture', window, imageData);

    % Draw texture image to backbuffer. It will be automatically
    % centered in the middle of the display if you don't specify a
    % different destination:
    Screen('DrawTexture', window, myTexture, [],  destinationRect);    