% A textual multiple choice dialog function that returns the value of the
% selected Choice.
%
% window - the window pointer
%
% questionMessage - the message to display above the options.
%
% choiceList - the list of Choice objects
%
%
% Author: Brian Armstrong
%
function [answer, responseTime ]= multipleChoiceDialog(window, questionMessage , choiceList)
    
    answer = 'notSelected';
    
    % start text that displays the question and choices
    formattedText = [questionMessage '\n\n'];
        
    [xPad, yPad] = cog_comm_tools.getScreenPadding(window);
    
    % append the text that displays the choices
    for i=1:length(choiceList)
        formattedText = [formattedText '\n\n' choiceList(i).keyCode ' : ' choiceList(i).value];
    end
    
    % display the text
    cog_comm_tools.drawTextAtPosition(window, formattedText, xPad, yPad);
    cog_comm_tools.displayWindow(window);
    
    % now the question is on the screen
    startTime = GetSecs();    
    answerInvalid = true;
    
    % flush out any lingering text in buffer
    FlushEvents('keyDown');
    
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
    
    % make sure no keys are pressed down before continuing...
    cog_comm_tools.waitUntilNoKeysPressed();    