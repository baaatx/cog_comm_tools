% BouncingImageScreenSaver_example.m - An example script that simulates a
% screen saver of a bouncing ball using cog_comm_tools.
% 
%
% Author: Brian Armstrong

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% DEFINE EXPERIMENT CONSTANTS
velocityReductionFactor = 8;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

% define the screen resolution the experiment is going to run on. [x y]
%screenResolution = [1152 864];
screenResolution = [800 600];

% store start time
startTime = GetSecs();

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS -
    % save the window pointer and the resolution structure
    [window, resolution ] = initializeWindow(fontFace, fontSize, fontStyle, screenResolution );

    % screen mid point coordinates
    midX = resolution.width / 2;
    midY = resolution.height / 2;
    
    % DISPLAY INSTRUCTIONS
    displayInstructions(window, 'An image will appear on the screen centered on the screen.  Click anywhere on the screen and the image will zoom to that position you click and then bounce around on the screen until you press ESC.');

    % DEFINE STIMULI
    % create image stimuli objects (encapsulates data for still image stimuli)
    imageStim = ImageStim('x0', 'stimuli/images/redBall.jpg', midX, midY, 'red ball');
    
    % reveals the hidden mouse cursor...
    ShowCursor();
    
    % display the image in its initial position
    displayImageStim(window, imageStim);
    
    % record the current (last) position the image was displayed at...
    lastXPos = midX;
    lastYPos = midY;
    
    % get the next mouse click
    [clicks , clickX , clickY , whichButton] = GetClicks();
        
    % calculate the dx and dy (velocity) amount of movement towards new
    % position
    dx = (clickX - lastXPos) / velocityReductionFactor;
    dy = (clickY - lastYPos) /  velocityReductionFactor;
    
    % loop condition
    keepGoing = true;
    
    while (keepGoing)
        % update coordinates
        lastXPos = lastXPos + dx;
        lastYPos = lastYPos + dy;
        
        displayImageStimAtPosition(window, imageStim, lastXPos, lastYPos);

        % check x bounds
        if (lastXPos > resolution.width+round(imageStim.width/2) || lastXPos <= round(imageStim.width/2))
            % change the direction
            dx = dx * -1;
        end
        
        % check y bounds
        if (lastYPos > resolution.height+round(imageStim.height/2) || lastYPos <= round(imageStim.height/2))
            % change the direction
            dy = dy * -1;
        end
        
        % check if we are trying to halt the experiment.
        if (checkForKeyPress('ESCAPE'))
            keepGoing = false;
        end
    end
    
    % SHUTDOWN THE EXPERIMENT
    shutDownExperiment();
    
catch
    % This "catch" section executes in case of an error in the "try" section above.
    % If we encounter an exception (an error) , we clean up.

    % Clean up.
    shutDownExperiment();
    
    % Since we are catching (handling) the error, we want to rethrow it so we can see
    % what happened. We only catch it to call shutDownExperiment.
    psychrethrow(psychlasterror);
end