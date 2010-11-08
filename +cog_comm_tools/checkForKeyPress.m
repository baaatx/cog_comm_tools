% Checks for a press of a key with 'keyCode' on the keyboard.
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