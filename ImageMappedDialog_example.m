%  ImageMappedDialog.m - A clickable image map example.
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
        
    % these are the values for the choices
    answers = {'one', 'two', 'three', 'four', 'five', 'six' , 'seven' , 'eight' , 'nine', 'ten'};
    
    % this gets us 1 row with ten columns for the part of the screen
    % where we displayed the spectrum image
    mapRects = getScreenGridRects(0, 800, 400, 600, 1, 10, false);
    
    % we need to show the cursor (it is hidden by default)
    ShowCursor();
        
    % here is the call that does all the work
    answer = imageMappedMultipleChoiceDialog(window, 'Click on that spectrum...\n\n Far left is ''one'' \n\n Far right is ''ten''...', 'stimuli/images/spectrum.jpg' , [0 400 800 600] , mapRects, answers);
    
    % let them know what they selected
    displayInstructions(window, ['You selected: ' answer], 1);
    
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