% A multiple choice dialog function that reports the the answer for
% arbitrary sub-rectangles of the screen.
%
% window - the window pointer
%
% imageMapList - rects that define choices
%
% imageMapValues - the values for those choices
%
%
% Author: Brian Armstrong
%
function answer = coordinateMappedMultipleChoiceDialog(window, imageMapRects, imageMapValues)
    
    % check that input is valid
    iMRSize = size (imageMapRects);
    if (~iMRSize(2) == length(imageMapValues))
        error('must have same number of columns of coordinates in imageMapRects as values in imageMapValues');
    end
    
    answer = '';
    
    % start text that displays the question and choices
    formattedText = [questionMessage '\n\n'];
    
    % draw the mapped image onto the screen buffer
    cog_comm_tools.drawImageDataAtDestRect(window, mapImageData, mapImageDestRect);
    
    % display the text
    DrawFormattedText(window, formattedText, 'center', 'center', 0);
    
    Screen('Flip',window);
        
    answerInvalid = true;
    
    % wait for a valid mouse click that represents an answer (a sub map)
    while (answerInvalid)
        arraySize = size(imageMapRects);
        [numClicks, clickX, clickY] = GetClicks();
        for i=1:arraySize(2)
            rect = [imageMapRects(1,i) imageMapRects(2,i) imageMapRects(3,i) imageMapRects(4,i) ];
            disp (rect);
            disp (clickX);
            disp (clickY);
            error ('');
            
            if (cog_comm_tools.checkClickIsInRange(rect, clickX, clickY))
                answerInvalid = false;
                answer = imageMapValues{i};
            end
        end
        cog_comm_tools.checkForEscapeKeyToHalt();
    end