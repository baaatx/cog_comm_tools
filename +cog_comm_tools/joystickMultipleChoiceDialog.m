% A joystick based multiple choice dialog function that reports the chosen answer and responseTime.
%
% window - the window pointer
%
% questionMessage - the message to display above the options.
%
% choiceList - the list of Choice objects (use textual name of joystick
% keys in joystickGetPressedButtons as the 'keyCode' for your choice object
% to use this function)
%
% Author: Brian Armstrong
%
function [answer, responseTime] = joystickMultipleChoiceDialog(window, questionMessage , choiceList)
    answer = '';
    
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
    
    % wait for a valid choice to be selected from the joystick
    while (answerInvalid)
        
        % gets string cell array of pressed buttons by name
        buttons = cog_comm_tools.joystickGetPressedButtons();
        
        % check if any valid choices have been indicated with button press
        for i=1:length(choiceList)
            if ( cog_comm_tools.cellArrayContains(buttons, choiceList(i).keyCode) )
                answerInvalid = false;
                answer = choiceList(i).value;
            end
        end
        
        % allow for halt with ESC key
        cog_comm_tools.checkForEscapeKeyToHalt();
    end
    
    % calculate the responseTime
    responseTime = GetSecs() - startTime;