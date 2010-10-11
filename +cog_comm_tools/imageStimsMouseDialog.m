% A visual multiple choice dialog function that reports which image stim was clicked
% on and what the response time was.
%
% window - the window pointer
%
% Author: Brian Armstrong
%
function [answer, responseTime] = imageStimsMouseDialog(window, imageStims)
    answer = 'notSet';
    responseTime = -1;
    
    % draw all the image stims
    for i=1:length(imageStims)
        cog_comm_tools.drawImageStim(window, imageStims(i));
    end
    
    Screen('Flip', window);
    
    answerInvalid = true;
    
    startTime = GetSecs();
    
    % wait for a valid mouse click that represents an answer (an imageStim)
    while (answerInvalid)
        [numClicks, clickX, clickY] = GetClicks();
        for i=1:length(imageStims)
            if ( cog_comm_tools.checkClickIsInRange( imageStims(i).destRect, clickX, clickY))
                answerInvalid = false;
                responseTime = GetSecs() - startTime;
                answer = imageStims(i).keyCode;
            end
        end
        cog_comm_tools.checkForEscapeKeyToHalt();
    end