% Checks to see if a space bar key was pressed, so the experimenter can pause the experiment.
%
% Author: Brian Armstrong
%
function checkForSpaceKeyToPause()
    spaceKey = KbName('space');
    if cog_comm_tools.checkForKeyPress('space')
        WaitSecs(2);
        while true
            [ keyIsDown, seconds, keyCode ] = KbCheck;
            if keyCode(spaceKey)
                break;
            else
                WaitSecs(0.2);
            end
        end
    end    