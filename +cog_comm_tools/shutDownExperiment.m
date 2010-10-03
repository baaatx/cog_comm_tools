% Shut Down Experiment
%
% This function should be called at the very end of any new experiment, and
% also in the catch section that follows the main try block.
%
% Add any additional requirements at shutdown to this function.
%
% Author: Brian Armstrong
%
function shutDownExperiment()
    % close all open file handles
    fclose('all');
    
    % close all open screens
    Screen('CloseAll');
    
    % reveal the cursor again (just in case of crash)
    ShowCursor;   