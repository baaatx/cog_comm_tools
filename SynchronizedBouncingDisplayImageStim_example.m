% SynchronizedBouncingDisplayImageStim_example.m - 
%
%  Displays an image in several time steps across the screen in straight
%  lines using functions in cog_comm_tools.
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

% here we are specifying what screen resolution we want
screenResolution = [1152 864];

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    % here we create 3 imageStim objects, which encapsulate the data needed
    % to present stimuli images.
    %
    % Constructor Call:
    %
    % function obj = ImageStim(keyCode, fileName, xPos, yPos, title)
    %
    s1 = ImageStim('x0', 'stimuli/images/redBall.jpg', 180,180, 'Red Ball');
    
    imageStim = s1;
    endX = 600;
    endY = 1000;
    numSteps = 20;
    secondsToMove = 1.23;
    
    displayImageStimMovingInALine(window, imageStim, endX, endY, numSteps, secondsToMove)

    endX = 420;
    endY = 820;
    
    displayImageStimMovingInALine(window, imageStim, endX, endY, numSteps, secondsToMove)

    endX = 432;
    endY = 321;
    
    displayImageStimMovingInALine(window, imageStim, endX, endY, numSteps, secondsToMove)

    endX = 632;
    endY = 621;
    
    displayImageStimMovingInALine(window, imageStim, endX, endY, numSteps, secondsToMove)

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