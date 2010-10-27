% Checks for a press of a defined Key.
%
% Checks to see if a key 'key' was pressed.
%
% keyCode - 'ESCAPE' , 'a', '1', etc.
%
% Author: Brian Armstrong
%
function isPressed = checkForKeyPress(keyCode)
    key = KbName(keyCode);

    [ keyIsDown, seconds, keyCode ] = KbCheck;
    
    if (keyIsDown && keyCode(key))
            isPressed = true;
    else
            isPressed = false;
    end   