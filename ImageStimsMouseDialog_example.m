%  ImageStimsMouseDialog_example.m - shows how to present images to be
%  clicked on.
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

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);

    % define our image stims
    s1 = ImageStim('x0-ball', 'stimuli/images/redBall.jpg', 150,70, 'Red Ball');
    s2 = ImageStim('x1-chicken', 'stimuli/images/babyChicken.jpg', 700,300, 'Baby Chicken');
    s3 = ImageStim('x2-finch', 'stimuli/images/redFinch.jpg', 150,550, 'Red Finch');
      
    % put the image stims into a list
    imageStims = [s1 s2 s3];
    
    % give them some instructions
    displayInstructions(window, 'Click on one of the images presented.', 1);
    
    % show the mouse cursor, it is hidden by default
    ShowCursor();

    % here is the function that does all the work
    [answer, responseTime ]= imageStimsMouseDialog(window, imageStims);
    
    % Tell them what they selected
    displayInstructions(window, ['You selected: ' answer ' after ' num2str(responseTime) ' seconds.'], 1);
        
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