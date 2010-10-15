%  ScreenGridding_example.m - shows how screen gridding works
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

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    displayInstructions(window, ['Screen Width:' num2str(resolution.width)]);
    displayInstructions(window, ['Screen Height:' num2str(resolution.height)]);
    
    % a list of image Data
    imageData = cell(1,4);
    imageData{1} = imread(char('stimuli/images/redBall.jpg'));
    imageData{2} = imread(char('stimuli/images/blackSix.jpg'));
    imageData{3} = imread(char('stimuli/images/blueTriangle.jpg'));
    imageData{4} = imread(char('stimuli/images/silverInfinity.jpg'));
    
    rows = 10;
    columns = 10;
    
    % we are adding a grid color (black) so we need one more spot in the
    % array for this image.
    theImageData = cell(1, rows*columns+1);
    
    % this is our background image (to color the grid padding)
    theImageData{1} = imread(char('stimuli/images/blackSquare.jpg'));
    
    % get some random image data to fill our grid
    for i=2:(rows*columns+1)
        theImageData{i} = imageData{randi(length(imageData))};
    end
    
    % this rect represents the full screen (for our background image)
    fullScreen = [0;0;resolution.width; resolution.height];
   
    % this function call gets the grid rectangles needed to draw the grid
    gridRects = getScreenGridRects(0, resolution.width, 0 , resolution.height, rows, columns, 3 , false);
    
    % make the background destRect (fullScreen) first so the background
    % gets drawn first to the entire window
    destinationRects = [fullScreen gridRects];
    
    startTime = GetSecs();
    
    % now we can draw our grid of images...
    displayMultipleImageDataAtDestRects(window, theImageData, destinationRects);
    
    endTime = GetSecs() - startTime;
    
    KbWait();
    
    displayInstructions(window, ['Time to Draw: ' num2str(endTime) ' seconds']);
        
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