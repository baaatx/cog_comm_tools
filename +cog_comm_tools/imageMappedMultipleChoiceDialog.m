% A textual multiple choice dialog function that reports the chosen answer
%
% window - the window pointer
%
% questionMessage - the message to display above the options.
%
% imageMapList - rects that define choices
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