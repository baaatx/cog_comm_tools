% Shut Down Experiment: This function should be called at the very end of any new experiment, and
% also in the catch section that follows the main try block.
%
% (Add any additional requirements at shutdown to this function.)
%
%
% Author: Brian Armstrong
%
function shutDownExperiment()
    % make sure MATLAB window gets key presses after we close
    ListenChar();   
        
    % close all open file handles
    fclose('all');
    
    % close all open screens
    Screen('CloseAll');
    
    % clear all matlab data from memory
    clear all;
        
    % reveal the cursor again (just in case of a crash)
    ShowCursor;
    
 