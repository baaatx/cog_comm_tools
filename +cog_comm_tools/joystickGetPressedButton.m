% Wrapper that returns a string for the button currently pressed on the Eyelink
% Joystick.
%
% NOTE: This only returns one string. (Use when you expect a single button
% press.)
%
% Author: Brian Armstrong
%
function button = joystickGetPressedButton()

    % check each bit of button state
    state = Eyelink('ButtonStates');
    
    button = 'none';
    
    % the 1 bit
    checkBits = bitand(state, 2);
    if (checkBits == 2)
        button = 'X';
    end
    
    % the 2 bit
    checkBits = bitand(state, 1);
    if (checkBits == 1)
        button = 'Y';
    end
    
    % the 4 bit
    checkBits = bitand(state, 8);
    if (checkBits == 8)
        button = 'A';
    end
    
    % the 8 bit
    checkBits = bitand(state, 4);
    if (checkBits == 4)
        button = 'B';
    end   
    
    % the 16 bit is set if the directional pad
    % (currently buttons states doesn't give you any information about
    % which direction it is pointed, all directions just show up as 16
    % bit...)
    checkBits = bitand(state, 16);
    if (checkBits == 16)
        button = 'directional';
    end
    
    % the 32 bit is set if the left button is pressed down
    checkBits = bitand(state, 32);
    if (checkBits == 32)
        button = 'left';
    end
    
    % the 64 bit is set if the right button is pressed down
    checkBits = bitand(state, 64);
    if (checkBits == 64)
        button = 'right';
    end