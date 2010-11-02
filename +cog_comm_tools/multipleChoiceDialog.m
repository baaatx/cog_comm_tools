% A textual multiple choice dialog function that reports the chosen answer
%
% window - the window pointer
%
% questionMessage - the message to display above the options.
%
% choiceList - the list of Choice objects
%
% Author: Brian Armstrong
%
function [answer, responseTime ]= multipleChoiceDialog(window, questionMessage , choiceList)
    
    answer = 'notSelected';
    
    % start text that displays the question and choices
    formattedText = [questionMessage '\n\n'];
    
    % append the text that displays the choices
    for i=1:length(choiceList)
        formattedText = [formattedText '\n\n' choiceList(i).keyCode ' : ' choiceList(i).value];
    end
    
    % display the text
    cog_comm_tools.drawTextAtPosition(window, formattedText, 200, 200);
    Screen('Flip',window);
    
    % now the question is on the screen
    startTime = GetSecs();    
    answerInvalid = true;
    
    % supress text from matlab window
    ListenChar(2);
    
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