% DisplayImageStims_example.m - Displays some imageStims...
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
    
    % here we create 3 imageStim objects, which encapsulate the data needed
    % to present stimuli images.
    %
    % Constructor Call:
    %
    % function obj = ImageStim(keyCode, fileName, xPos, yPos, title)
    %
    s1 = ImageStim('x0', 'stimuli/images/redBall.jpg', 150,70, 'Red Ball');
    s2 = ImageStim('x1', 'stimuli/images/babyChicken.jpg', 700,300, 'Baby Chicken');
    s3 = ImageStim('x2', 'stimuli/images/redFinch.jpg', 150,550, 'Red Finch');
      
    % put the image stims into a single list
    imageStims = [s1 s2 s3];
    
    % draw and display them (with one function call)
    drawImageStimsWithTitle(window, imageStims);
    Screen('Flip', window);
    
    % wait 3 seconds
    WaitSecs(3);
        
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