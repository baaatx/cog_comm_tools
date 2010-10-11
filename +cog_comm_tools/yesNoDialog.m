% Wrapper for a yesNoDialog
%
% Author: Brian Armstrong
%
function answer = yesNoDialog(window, questionMessage)
    yes = cog_comm_tools.Choice('y', KbName('y'), 'Yes');
    no = cog_comm_tools.Choice('n', KbName('n'), 'No');
    choiceList = [yes no ];    
    answer = cog_comm_tools.multipleChoiceDialog(window, questionMessage , choiceList);
    if (strcmp(answer, 'Yes'))
        answer = true;
    else
        answer = false;
    end