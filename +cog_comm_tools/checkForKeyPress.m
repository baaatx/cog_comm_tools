% Checks if a key with 'keyCode' is currently being pressed on the
% keyboard.  This function does not wait.
%
% keyCode - 'ESCAPE' , 'a', '1', etc.
%
%
% Author: Brian Armstrong
%
function isPressed = checkForKeyPress(keyCode)
    key = KbName(keyCode);

    isPressed = false;
    
    % call KbCheck for keyboard status...
    [ keyIsDown, seconds, keyCode ] = KbCheck();
    
    if (keyIsDown && keyCode(key))
            isPressed = true;
    end   