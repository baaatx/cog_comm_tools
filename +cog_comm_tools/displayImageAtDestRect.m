% Displays image file 'imageFileName' on the screen at position
% destinationRect.
%
% window - the window pointer
%
% imagefileName - file name for a valid image file
%
% destinationRect - the destRect where the image data should be displayed
%
% NOTE: destRect = [0,0,maxX,maxY] would draw on the entire screen...
% if (destRect == []) then should center on the screen.
%
%
% Author: Brian Armstrong
function displayImageAtDestRect(window, imageFileName, destinationRect)
    % read stimulus image into matlab matrix 'imdata':
    imdata=imread(char(imageFileName));

    % make texture image out of image matrix 'imdata'
    myTexture=Screen('MakeTexture', window, imdata);

    % Draw texture image to backbuffer. It will be automatically
    % centered in the middle of the display if you don't specify a
    % different destination:
    Screen('DrawTexture', window, myTexture, [],  destinationRect);

    % Show stimulus on screen at next possible display refresh cycle
    cog_comm_tools.displayWindow(window);