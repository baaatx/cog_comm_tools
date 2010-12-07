% Function that displays the instructions in 'str' on the screen. 
% Wait 'delay' long before allowing to continue. You can allow the user
% to continue by either the 'mouse', the 'keyboard', or the eyelink 'joystick'. 
%
% window - the window pointer
%
% instructionsText - the instructions text string  
%
% delay (optional) - how long in seconds to wait before allowing them to continue
%
% continueType (optional) - string specifiying how to let the participant continue.
% Can be 'mouse' or 'joystick', default is 'keyboard'
%
%
% Author: Brian Armstrong
%
function displayInstructions(window, instructionsText, delay, continueType)
    if (nargin < 3)
        % default delay before allowing them to continue is a third of a
        % second...
        delay = 0.33;
    end
    
    if (nargin < 4)
        % default continueType is keyboard
        continueType = 'keyboard';
    end
    
    FlushEvents('keyDown');

    if (strcmp(continueType, 'mouse'))
        instructionsText = [instructionsText '\n\n\n(Click Any Button on Mouse To Continue)'];
    elseif (strcmp(continueType, 'joystick'))
        instructionsText = [instructionsText '\n\n\n(Press Any Joystick Button To Continue)'];
    else 
        instructionsText = [instructionsText '\n\n\n(Press Any Key To Continue)'];
    end
    
    DrawFormattedText(window, instructionsText, 150, 'center', 0, 55, [], [],1.5);
    Screen('Flip',window);
    WaitSecs(delay);

    if (strcmp(continueType, 'mouse'))
        GetClicks();
    elseif (strcmp(continueType, 'joystick'))
        cog_comm_tools.joyStickWaitForButton();
    else 
        KbWait();
    end