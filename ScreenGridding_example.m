%  ScreenGridding_example.m - shows how screen gridding works with image
%  stims...
%
% Author: Brian Armstrong
%
% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 24;
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
    
    displayInstructions(window, ['Selected Screen Width:' num2str(resolution.width)]);
    displayInstructions(window, ['Selected Screen Height:' num2str(resolution.height)]);
    displayInstructions(window, 'Many randomly selected image stims will be\npresented in a grid format.\n\nHit any key on the keyboard afterwards to exit.');
    
    % DEFINE STIMULI
    % create image stimuli objects (encapsulates data for image stimuli)
    s1 = ImageStim('x0', 'stimuli/images/babyChicken.jpg', 0, 0 , 'baby chicken');
    s2 = ImageStim('x1', 'stimuli/images/cross_hairs.jpg', 0, 0 , 'cross hairs');
    s3 = ImageStim('x2', 'stimuli/images/armadillo-purse.jpg', 0, 0, 'armadillo purse');
    s4 = ImageStim('x3', 'stimuli/images/heart.jpg', 0, 0, 'heart');
    s5 = ImageStim('x4', 'stimuli/images/silverInfinity.jpg', 0, 0, 'infinity');
    s6 = ImageStim('x6', 'stimuli/images/blackSix.jpg', 0, 0, 'six');
    s7 = ImageStim('x7', 'stimuli/images/redCross.jpg', 0, 0, 'cross');
    
    imageStims = [s1 s2 s3 s4 s5 s6 s7];
    
    rows = 10;
    columns = 14;
    
    % we are adding a grid color (black) so we need one more spot in the
    % array for this image.
    theImageStims = cell(1, rows*columns);
        
    % get some random image stims to fill our grid
    for i=1:(rows*columns)
        theImageStims{i} = imageStims(randi(length(imageStims)));
    end
   
    % this function call gets the grid rectangles needed to draw the grid
    %
    % NOTE: 20 is the paddingWidth, and true means return square shaped
    % cells, (false would return rectangular shaped cells)
    %
    gridRects = getScreenGridRects(0, resolution.width, 0 , resolution.height, rows, columns, 10 , true);
    
    startTime = GetSecs();
    
    % now we can draw our grid of images...
    displayImageStimsAtDestRects(window, theImageStims, gridRects);
    
    % calculate the time to draw the grid...
    endTime = GetSecs() - startTime;
    
    % wait for a key press...
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