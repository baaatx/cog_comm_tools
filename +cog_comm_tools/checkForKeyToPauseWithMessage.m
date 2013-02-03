% Checks to see if a key was pressed, so the experimenter can pause the experiment.
% Displays a visual message 'Paused' while paused.
% Once the experiment is paused, the experimenter can press the space bar
% again to resume the experiment.
%
%
% pauseKeyCode - keyCode of key that will trigger pause
%
% exitKeyCode - keyCode that will exit program once paused
%
% window - window pointer
%
% textOfMessage - text to be displayed on screen when paused.
%
% Author: Brian Armstrong

function checkForKeyToPauseWithMessage(pauseKeyCode, exitKeyCode, window, textOfMessage)
    % get rid of any lingering keyDown events...
    FlushEvents('keyDown');
    
    if ( cog_comm_tools.checkForKeyPress(pauseKeyCode) )
  
        paused = true;
        
        cog_comm_tools.displayTextCentered(window, textOfMessage);
        
        % wait until there are no keys pressed.
        cog_comm_tools.waitUntilNoKeysPressed();
        
        while (paused)
            % stay paused until another space key press.
            paused = ~cog_comm_tools.checkForKeyPress(pauseKeyCode);
            exit = cog_comm_tools.checkForKeyPress(exitKeyCode);
            
            if (exit)
                error('program terminated by user');
            end
            
            
            % pause busy loop
            WaitSecs(0.01);
        end
        
        cog_comm_tools.clearWindow(window);
        
         % wait until there are no keys pressed.
        cog_comm_tools.waitUntilNoKeysPressed();
    end