% A clickable image mapped multiple choice dialog function that returns the
% answer that is clicked on...
%
% The mapImageFile is used as an image map, each destRect in imageMapList
% is associated with the cooresponding element of imageMapValues.
%
% window - the window pointer
%
% questionMessage - the message to display above the options.
%
% mapImageFile - the image file for the imageMap (the area to click on)
%
% mapImageDestRect - (where to draw the imageMap image).
%
% imageMapList - rects that define valid choices (inside of
% mapImageDestRect)
%
% imageMapValues - the list of values to return for each of the destRects
% in imageMapList
%
%
% Author: Brian Armstrong
%
function answer = imageMappedMultipleChoiceDialog(window, questionMessage , mapImageFile, mapImageDestRect, imageMapRects, imageMapValues)
    answer = '';
        
    % start text that displays the question and choices
    formattedText = [questionMessage '\n\n'];
    
    % get the image data
    mapImageData = imread(char(mapImageFile));
    
    % draw the mapped image onto the screen buffer
    cog_comm_tools.drawImageDataAtDestRect(window, mapImageData, mapImageDestRect);
    
    % display the text
    cog_comm_tools.drawTextAtPosition(window, formattedText, 200,200);
    Screen('Flip',window);
        
    answerInvalid = true;
    
    % wait for a valid mouse click that represents an answer (a sub map)
    while (answerInvalid)
        arraySize = size(imageMapRects);
        [numClicks, clickX, clickY] = GetClicks();
        for i=1:arraySize(2)
            rect = [imageMapRects(1,i) imageMapRects(2,i) imageMapRects(3,i) imageMapRects(4,i) ];
            if (cog_comm_tools.checkClickIsInRange(rect, clickX, clickY))
                answerInvalid = false;
                answer = imageMapValues{i};
            end
        end
        cog_comm_tools.checkForEscapeKeyToHalt();
    end