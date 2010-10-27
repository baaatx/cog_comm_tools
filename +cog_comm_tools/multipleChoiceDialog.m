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
function answer = multipleChoiceDialog(window, questionMessage , choiceList)
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
        cog_comm_tools.checkForEscapeKeyToHalt();
    end
    
    % un-supress text from matlab window
    ListenChar(1);
    