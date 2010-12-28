% Wrapper to wait until a button is pressed on the Joystick to continue.
%
% Returns the button states of the controller and the response time.
%
%
% Author: Brian Armstrong
%
function [buttonState, responseTime] = joystickWaitForButton()

    buttonState = 0;
    startTime = GetSecs();

    % keep polling until any button is pressed.
    while (buttonState == 0)
        buttonState = Eyelink('ButtonStates');
    end
    
    responseTime = GetSecs() - startTime;    