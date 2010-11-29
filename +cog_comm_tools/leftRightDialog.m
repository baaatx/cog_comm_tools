% Wrapper for a left-right (no/yes) dialog using the 'z' and '/?' keys.
%
% window - the window pointer
% 
% questionMessage - the string of the question message to display
%
%
% Author: Brian Armstrong
%
function [answer, responseTime] = leftRightDialog(window, questionMessage)
    
    % clear the window (to make transition cleaner)
    cog_comm_tools.clearWindow(window);

    % get the resolution from window
    resolution=Screen('Resolution', window); 

    % use 'z' and '/?' keys for yes and no
    yes = cog_comm_tools.Choice('/?', 'Yes');
    no = cog_comm_tools.Choice('z', 'No');
    
    % draw question and options to the window buffer and draw the window
    cog_comm_tools.drawTextAtPosition(window, questionMessage, 400, 400);
    cog_comm_tools.drawTextAtPosition(window, 'Z: No' , 200 , resolution.height - 400);
    cog_comm_tools.drawTextAtPosition(window, '/?: Yes' , resolution.width - 400 , resolution.height - 400);
    cog_comm_tools.drawWindow(window);

    % send choiceList to multiple choice dialog function
    choiceList = [yes no];    
    [answer, responseTime] = cog_comm_tools.multipleChoiceDialogNoDisplay(choiceList);
    
    % return the result
    if (strcmp(answer, 'Yes'))
        answer = true;
    else
        answer = false;
    end