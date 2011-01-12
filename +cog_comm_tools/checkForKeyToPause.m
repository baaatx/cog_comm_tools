% Checks to see if a key was pressed, so the experimenter can pause the experiment.
% Once the experiment is paused, the experimenter can press the key again
% to resume the experiment.
%
%
% Author: Brian Armstrong
%
function checkForKeyToPause(keyCode)
    % get rid of any lingering keyDown events...
    FlushEvents('keyDown');
    
    if ( cog_comm_tools.checkForKeyPress(keyCode) )
        % wait until there are no keys pressed.
        cog_comm_tools.waitUntilNoKeysPressed();
        
        paused = true;
        
        while (paused)
            % stay paused until another space key press.
            paused = ~cog_comm_tools.checkForKeyPress(keyCode);
            
            % pause busy loop
            WaitSecs(0.01);
        end
        
         % wait until there are no keys pressed.
        cog_comm_tools.waitUntilNoKeysPressed();
        
    end