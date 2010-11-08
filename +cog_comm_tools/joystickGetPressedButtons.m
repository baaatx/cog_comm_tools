% Wrapper that returns a string cell array for the buttonMapcurrently pressed on the Eyelink
% Joystick.
%
% NOTE: This returns multiple buttons, each element of the cell array...
%
%
% Author: Brian Armstrong
%
function buttons = joystickGetPressedButtons()

    % check each bit of buttonMapstate
    state = Eyelink('ButtonStates');
    buttons = {};
    pos = 1;
    
    % the 1 bit
    checkBits = bitand(state, 2);
    if (checkBits == 2)
        buttons{pos} = 'X';
        pos = pos + 1;
    end
    
    % the 2 bit
    checkBits = bitand(state, 1);
    if (checkBits == 1)
        buttons{pos}= 'Y';
        pos = pos + 1;
    end
    
    % the 4 bit
    checkBits = bitand(state, 8);
    if (checkBits == 8)
        buttons{pos}= 'A';
        pos = pos + 1;
    end
    
    % the 8 bit
    checkBits = bitand(state, 4);
    if (checkBits == 4)
        buttons{pos}= 'B';
        pos = pos + 1;
    end   
    
    % the 16 bit is set if the directional pad
    % (currently buttons states doesn't give you any information about
    % which direction it is pointed, all directions just show up as 16
    % bit...)
    checkBits = bitand(state, 16);
    if (checkBits == 16)
        buttons{pos}= 'directional';
        pos = pos + 1;
    end
    
    % the 32 bit is set if the left buttonMapis pressed down
    checkBits = bitand(state, 32);
    if (checkBits == 32)
        buttons{pos}= 'left';
        pos = pos + 1;
    end
    
    % the 64 bit is set if the right buttonMapis pressed down
    checkBits = bitand(state, 64);
    if (checkBits == 64)
        buttons{pos} = 'right';
    end