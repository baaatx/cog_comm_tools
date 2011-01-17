% Wrapper for a yesNoDialog. (Return boolean true or false with choices
% 'y:Yes' and 'n:No' while presenting questionMessage).
%
% window - the window pointer
% 
% questionMessage - the string of the question message to display
%
%
% Author: Brian Armstrong
%
function answer = yesNoDialog(window, questionMessage)
    
    % the Choice objects.
    yes = cog_comm_tools.Choice('y', 'Yes');
    no = cog_comm_tools.Choice('n', 'No');
    
    % choice list to pass to dialog function
    choiceList = [yes no ];    
    
    % call dialog
    answer = cog_comm_tools.multipleChoiceDialog(window, questionMessage , choiceList);
    
    % return true or false
    if (strcmp(answer, 'Yes'))
        answer = true;
    else
        answer = false;
    end