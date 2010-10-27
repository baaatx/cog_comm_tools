% Function that displays the instructions in 'str' on the screen. 
% Wait 'delay' long before allowing to continue by pressing any key.
%
% You can allow the user to continue by either the mouse, the keyboard, or the eyelink joystick. 
%
% Author: Brian Armstrong
%
function displayInstructions(window, str, delay, continueType)
    if (nargin < 3)
        % default delay before allowing them to continue is a third of a
        % second...
        delay = 0.33;
    end
    
    if (nargin < 4)
        % default continueType is keyboard
        % second...
        continueType = 'keyboard';
    end
    
    FlushEvents('keyDown');

    if (strcmp(continueType, 'mouse'))
        str = [str '\n\n\n(Click Any Button on Mouse To Continue)'];
    end
    
    if (strcmp(continueType, 'joystick'))
        str = [str '\n\n\n(Press Any Joystick Button To Continue)'];
    else 
        str = [str '\n\n\n(Press Any Key To Continue)'];
    end
    
    DrawFormattedText(window, [str], 150, 'center', 0, 55, [], [],1.5);
    Screen('Flip',window);
    WaitSecs(delay);

    if (strcmp(continueType, 'mouse'))
        GetClicks();
    end
    
    if (strcmp(continueType, 'joystick'))
        cog_comm_tools.joyStickWaitForButton();
    else 
        KbWait();
    end