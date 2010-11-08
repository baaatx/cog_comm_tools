% Wrapper for a yesNoDialog
%
% window - the window pointer
% 
% questionMessage - the string of the question message to display
%
%
% Author: Brian Armstrong
%
function answer = yesNoDialog(window, questionMessage)
    yes = cog_comm_tools.Choice('y', 'Yes');
    no = cog_comm_tools.Choice('n', 'No');
    choiceList = [yes no ];    
    answer = cog_comm_tools.multipleChoiceDialog(window, questionMessage , choiceList);
    if (strcmp(answer, 'Yes'))
        answer = true;
    else
        answer = false;
    end