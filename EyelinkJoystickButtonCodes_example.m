% EyelinkJoystickButtonCodes_example.m - demonstrates how the Eyelink
% Joystick state code works to represent which buttons are pushed.
%
%
% Author: Brian Armstrong
%

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

dt = 0.5;

% here we are specifying what screen resolution we want
screenResolution = [1152 864];

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
  
    % To use the Eyelink Joystick, must connect to Eyelink...
    initializeEyelink(window, resolution);
 
    displayInstructions(window, 'Please pick up the Joystick...', dt, 'joystick');
    
    displayInstructions(window, 'Press Buttons on JoyStick to see the result of the Eyelink ''ButtonStates'' variable. The set bits in the resulting number represent which buttons\nare pressed down.\n\nYou will see this interactively...\n\nPress ESC on keyboard to quit when you are finished with the demo.', 1, 'joystick');

    % until they halt with ESC...
    while (true)
        % get the current ButtonStates variable.
        result = Eyelink('ButtonStates');
        
        % display the integer and binary representation of the number...
        displayTextCentered(window, ['Integer:' num2str(result) '\n\nBinary:' dec2bin(result)]);
        
        % check for Halt...
        if (checkForKeyPress('ESCAPE'))
            break;
        end
        
        % Note: busy loop... wait for a 1/10 a milisecond to allow other
        % threads to process...
        WaitSecs(0.0001);
    end
    
    % SHUTDOWN THE EXPERIMENT
    shutDownExperiment();
  
catch
    % This "catch" section executes in case of an error in the "try" section above.
    % If we encounter an exception, we clean up.

    % Clean up.
    shutDownExperiment();
    
    % Since we are catching (handling) the error, we want to rethrow it so we can see
    % what happened. We only catch it to call shutDownExperiment.
    psychrethrow(psychlasterror);
end