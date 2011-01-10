%  ClickImageInGrid_example.m - shows two ways to present images in a grid
%  format... Example usage of a image mapped clickable dialog with the
%  mouse.
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
screenResolution = [1024 768];

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);

    midX = round(resolution.width / 2);
    midY = round(resolution.height / 2);
    
    s1 = ImageStim('x0-ball', 'stimuli/images/redBall.jpg', midX,midY, 'Red Ball');
    s2 = ImageStim('x1-chicken', 'stimuli/images/babyChicken.jpg', midX,midY, 'Baby Chicken');
    s3 = ImageStim('x2-finch', 'stimuli/images/redFinch.jpg', midX,midY, 'Red Finch');
    s4 = ImageStim('x3-pinkSquare', 'stimuli/images/pinkSquare.jpg',  midX,midY, 'Pink Square');
        
    % put the image stims in a list 
    imageStims = [s1 s2 s3 s4];
    
    % define the number of rows and columns in our grid...
    rows = 2;
    columns = 2;
    paddingWidth = 10;    
    
    %
    % note: we are resetting the destRect of each ImageStim object with a new destRect (the grid cell).
    % the function we use makes sure the image is formatted properly by using the fitDestRect function,
    % which assures the image fits correctly inside its new on-screen
    % location...
    
    % this function breaks the area of the screen we want to use into
    % rectangles, and returns those rectangles as rows in a matrix.
    
    % Note:true here indicates to force as square cells.
    gridDestRects = getScreenGridDestRectRows(0, resolution.width, 0 , resolution.height, rows, columns, paddingWidth , true);
   
    % sets and fits the cooresponding imageStim with its destRect (here a
    % position in the grid...
    imageStims = setAndFitImageStimDestRects(imageStims, gridDestRects);
    
    % give them some instructions
    displayInstructions(window, 'Click on one of the images presented.');
    
    % show the mouse cursor, it is hidden by default
    ShowCursor();
    
    % here is the dialog function that does all the work
    [answer, responseTime ]= imageStimsMouseDialog(window, imageStims);
    
    % Tell them what they selected
    displayInstructions(window, ['You selected: ' answer ' after ' num2str(responseTime) ' seconds.']);
   
    % Do the same sort of gridding display a different way.
    gridRectMap = getScreenGridDestRectMap(0, resolution.width, 0 , resolution.height, rows, columns, paddingWidth, true);
    
    % fit and set the dest rect of each stim to a grid cell...
    s4.destRect = fitDestRect(gridRectMap ('1,1'), s4.destRect);
    s3.destRect = fitDestRect(gridRectMap ('1,2'), s3.destRect);
    s2.destRect = fitDestRect(gridRectMap ('2,1'), s2.destRect);
    s1.destRect = fitDestRect(gridRectMap ('2,2'), s1.destRect);
    
    % create the list for the dialog function
    imageStims = [s1 s2 s3 s4];
    
    % here is the dialog function that does all the work
    [answer, responseTime ]= imageStimsMouseDialog(window, imageStims);

    % Tell them what they selected
    displayInstructions(window, ['You selected: ' answer ' after ' num2str(responseTime) ' seconds.']);

    % we are finished...
    displayInstructions(window, 'Example Complete...');
    
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