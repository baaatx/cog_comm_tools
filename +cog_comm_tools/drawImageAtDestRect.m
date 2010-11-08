% Draws image file on the screen at position destinationRect. 
%
% window - the window pointer
%
% imageFileName - the image to draw
%
% destinationRect - the destRect to draw to.
%
%
% Author: Brian Armstrong
%
function drawImageAtDestRect(window, imageFileName, destinationRect)
    % read stimulus image into matlab matrix 'imdata':
    imdata=imread(char(imageFileName));

    % make texture image out of image matrix 'imdata'
    myTexture=Screen('MakeTexture', window, imdata);

    % Draw texture image to backbuffer. It will be automatically
    % centered in the middle of the display if you don't specify a
    % different destination:
    Screen('DrawTexture', window, myTexture, [],  destinationRect);