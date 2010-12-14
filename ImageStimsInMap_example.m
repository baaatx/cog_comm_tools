% DisplayImageStimsInMap_example.m - Displays some imageStims that are
% stored in a Map object for organization and randomization with constraints.
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

imageDisplayTime = 1.0;
screenResolution = [800 600];

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
    
    % Set this stim as invalid (valid = false implies that this stim is filler)
    img1 = ImageStim('x0', 'stimuli/images/redBall.jpg', 150,70, 'Red Ball');
    img1.valid = false;
    
    img2 = ImageStim('x1', 'stimuli/images/babyChicken.jpg', 700,300, 'Baby Chicken');
    
    img3 = ImageStim('x2', 'stimuli/images/redFinch.jpg', 150,550, 'Red Finch');
    img3.valid = false;
    
    img4 = ImageStim('x3', 'stimuli/images/silverInfinity.jpg', 150,550, 'Silver Infinity');
        
    % NOTE:
    %
    % A Map is a useful data structure. It allows you to access an arbitrary element
    % by a key.
    %
    % This can be useful in experiments when you want to refer to a stimuli
    % by a key code in your logic.  Follow the example below.
    %
    
    % create a new map object
    imageStimsMap = containers.Map();
    
    % add the image stimuli to the map by keyCode
    imageStimsMap(img1.keyCode) = img1;
    imageStimsMap(img2.keyCode) = img2;
    imageStimsMap(img3.keyCode) = img3;
    imageStimsMap(img4.keyCode) = img4;

    % the ordering for the stims - a cell array of keyCodes.
    % Each Stim appears 3 times, but we will randomize this ordering with
    % the constraint that no more than 3 valid or invalid stims appear in a
    % row and that no stim appears twice in a row.
    exampleOrdering = { 'x0' , 'x1', 'x2', 'x3' , 'x0' , 'x1', 'x2', 'x3' , 'x0' , 'x1', 'x2', 'x3'};

    % shuffle the ordering such that no more than 3 valid or invalid stims
    % appear in a row. 
        
    exampleOrdering = shuffleStimOrdering(imageStimsMap, exampleOrdering);
            
    displayInstructions(window, 'Ready to display image stims in Random Ordering...');
    
    % display them by the exampleOrdering for one second each
    for i=1:length(exampleOrdering)
        
        % grab the current image stim
        currentStim = imageStimsMap(exampleOrdering{i});
                
        %  determine if it is valid or not
        if (currentStim.valid)
            boolValue = 'valid';
        else
            boolValue = 'invalid';
        end
        
        % draw the title of the stim and if it is valid or not for
        % demonstration purposes. (this gets drawn to the screen when
        % displayImageStimCentered flips the screen...)
        %drawTextAtPosition(window, [ currentStim.title ' : ' boolValue ], 200, 200);
        
        % display the image stim.
        %
        % NOTE: notice we get the imageStim out of the map by using a key in our exampleOrdering.

        displayImageStimWithTitle(window, currentStim);
        
        % wait imageDisplayTime seconds
        WaitSecs(imageDisplayTime);
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