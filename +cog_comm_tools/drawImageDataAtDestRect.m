% Draws image data 'imageData' on the screen at position
% destinationRect. BUT DOES NOT FLIP SCREEN.
%
%  TOP LEFT CORNER OF SCREEN is x=0, y=0.
%
%  destRect = [0,0,maxX,maxY] would draw on the entire screen...
%
function drawImageDataAtDestRect(window, imageData, destinationRect)
    % make texture image out of image matrix 'imageData'
    myTexture=Screen('MakeTexture', window, imageData);

    % Draw texture image to backbuffer. It will be automatically
    % centered in the middle of the display if you don't specify a
    % different destination:
    Screen('DrawTexture', window, myTexture, [],  destinationRect);    