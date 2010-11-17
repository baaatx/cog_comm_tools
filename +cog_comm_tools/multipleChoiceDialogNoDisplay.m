% A textual multiple choice dialog function that reports the chosen answer
% (does not display anything)
%
% choiceList - the list of Choice objects
%
%
% Author: Brian Armstrong
%
function [answer, responseTime ]= multipleChoiceDialogNoDisplay(choiceList)
    
    answer = 'notSelected';
    answerInvalid = true;
    
    % supress text from matlab window
    ListenChar(2);
    
    % store start time
    startTime = GetSecs();
    
    % wait for a valid choice to be selected from the keyboard
    while (answerInvalid)
        KbWait();
        for i=1:length(choiceList)
            if (cog_comm_tools.checkForKeyPress(choiceList(i).keyCode))
                answerInvalid = false;
                answer = choiceList(i).value;
            end
        end
        % allow halt with ESC key
        cog_comm_tools.checkForEscapeKeyToHalt();
    end
    
    % calculate response time
    responseTime = GetSecs() - startTime;
    
    % un-supress text from matlab window
    ListenChar(1);