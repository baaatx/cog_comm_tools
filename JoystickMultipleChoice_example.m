% JoystickMultipleChoice_example.m - shows how multiple choice works when
% using the joystick.
%
% Author: Brian Armstrong
%

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

% here we are specifying what screen resolution we want
screenResolution = [800 600];

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    % define the choice options
    % Choice(keyCode, value)
    %
    %    NOTE: keyCode is which key they press to choose that option
    %          and it must represent a valid key on the joystick.
    %          (X Y A B left right directional)
    %
    A = Choice('X', 'Smell');
    B = Choice('Y', 'Sight');
    C = Choice('A', 'Hearing');
    D = Choice('B', 'Touch');
    
    % the choice list
    choiceList = [A B C D];

    % must initializeEyelink to use the Joystick
    initializeEyeLink(window, resolution);
    
    % start the multiple Choice Dialog
    [answer , responseTime] = joystickMultipleChoiceDialog(window, 'Which sense if the most useful?' , choiceList);
    
    % tell them what they selected and how fast
    displayInstructions(window, ['You selected ' answer ' after ' num2str(responseTime) ' seconds.'], 1, 'joystick');
    
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