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
        formattedText = [formattedText '\n' choiceList(i).keyString ' : ' choiceList(i).value];
    end
    
    % display the text
    DrawFormattedText(window, formattedText, 'center', 'center', 0);
    Screen('Flip',window);
        
    answerInvalid = true;
    
    % wait for a valid choice to be selected from the keyboard
    while (answerInvalid)
        KBWait();
        for i=1:length(choiceList)
            if (cog_comm_tools.checkForKeyPress(choiceList(i).keyValue))
                answerInvalid = false;
                answer = choiceList(i).value;
            end
        end
        cog_comm_tools.checkForEscapeKeyToHalt();
    end