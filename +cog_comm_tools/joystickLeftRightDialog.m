% Wrapper for a left right (button) dialog using the Eyelink provided Joystick
%
% NOTE: This function will wait until the left or right trigger button is pressed before
% it continues. In the case they press both buttons at exactly the same
% cycle, it defaults to the left button.
%
% Author: Brian Armstrong
%
function [answer, responseTime] = joystickLeftRightDialog()
    
    startTime = GetSecs();
    validPress = false;

    % keep waiting until the left or right button is pressed down
    while (validPress == false)
        result = Eyelink('ButtonStates');
        responseTime = GetSecs() - startTime();
        
        % the 32 bit is set if the left button is pressed down
        checkbits = bitand(result, 32);
        if (checkbits == 32 )
           answer = 'left';
           validPress = true;
        end
        
        checkbits = bitand(result, 64);
        % the 64 bit is set if the right button is pressed down
        if (checkbits == 64 )
           answer = 'right';
           validPress = true;
        end
    end