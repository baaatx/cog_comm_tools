% Checks for a press of a defined Key.
%
% Checks to see if a key 'key' was pressed.
%
% key - instance of a key (like 'escapeKey = KbName('ESCAPE');')
%
% Author: Brian Armstrong
%
function isPressed = checkForKeyPress(key)
    [ keyIsDown, seconds, keyCode ] = KbCheck;
    if keyIsDown && keyCode(key)
            isPressed = true;
    else
            isPressed = false;
    end
    
    