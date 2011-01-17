%  AboveBelowImagesInGrid_experiment - an example experiment where the
%  participant describes where one object is relative to the others shown.
%  The images are presented in a grid, and are associated with imageStim
%  objects using a map of grid positions (such as 1,1 for row 1 col 1)...
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
fontColor = getRGBColor('white');

backgroundColor = getRGBColor('black');

%experimental constants...
audioRecordingLength = 15.0;
interTrialDelay = 1.0;

% here we are specifying what screen resolution we want
screenResolution = [1024 768];

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    participantId = 'exampleParticipantId';
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution, fontColor);
    
    % We create three ImageStim objects, initialized to position (0,0) on the screen.
    %
    % Note: We don't really need to set an initial position in this case,
    % because we are only presenting the images in grid positions.  
    % But the constructor for an ImageStim object is shown for example. 
    %
     
    % The initial position is the position the the ImageStim is displayed
    % at when using display or drawImageStim().  You can reset the destRect of an
    % ImageStim object after it is created... This is what we do in this
    % example... Follow the code below and read the code for the functions
    % used for more information...
    
    s1 = ImageStim('s1', 'stimuli/images/redBall.jpg', 0,0, 'Red Ball');
    s2 = ImageStim('s2', 'stimuli/images/babyChicken.jpg', 0,0, 'Baby Chicken');
    s3 = ImageStim('s3', 'stimuli/images/redFinch.jpg', 0,0, 'Red Finch');
            
    % put the image stims in a map.
    imageStimsMap = containers.Map();
    imageStimsMap('s1') = s1;
    imageStimsMap('s2') = s2;
    imageStimsMap('s3') = s3;
    
    % give them some instructions
    displayInstructions(window, 'You will see three images displayed on the screen.  When you hear a beep, speak outload and describe the position of the leftmost image relative to the other two images.  When you are finished speaking, press the space key...');
    
    % Note: trialInfo is a cell array we define for the needs of our
    % experiment.  For each trial, we need to know the position we want to
    % put each image.  So we have this format. 
    %
    %     {stimKey1 , position1, stimKey2, position 2, ...} 
    %
    % for the cell array describing the trial.
    %
    % trialInfo is a cell array of cell arrays... (A cell array of arrays, 
    % each of which describes that trial, based on its position in
    % trialInfo...)
    %
    
    % trials info contains three cell arrays, each cell array describes the
    % position of the images for that trial... (So in the first trial,
    % imageStim 's1' is in position 1,1, and so on...) We use this trial
    % info to drive the logic for the trials... See the trials loop
    % below...
    trialInfo = {{'s1', '1,1' , 's2', '2,2' , 's3', '2,3'} , {'s1', '3,1' , 's2', '1,2' , 's3', '1,3'} , {'s1', '2,1' , 's2', '2,2' , 's3', '2,3'}};

    % define the number of rows and columns in our grid...
    rows = 3;
    columns = 3;
    
    % paddingWidth is a parameter of getScreenGridDestRectMap... it is the
    % number of pixels between each cell grid 
    %
    % Note: With a background color
    % drawn first, this is the width of the border around each cell)
    paddingWidth = 10;    
    
    % Get the destRects (destination rectangles) for the grid. See the code
    % for the function for more information. This call grids the entire
    % screen into rows + columns square cells. It returns a map where the
    % key for each grid cell is it's row,col coordinates such as '1,1' for
    % first row first column...
    
    gridRectMap = getScreenGridDestRectMap(0, resolution.width, 0 , resolution.height, rows, columns, paddingWidth, true);
    
    % run the trials (based on the trialInfo above...
    for trialNum=1:length(trialInfo)
        
        % fill the window with the background color before drawing...
        % (the background should be drawn first...)
        fillWindow(window, backgroundColor);
        
        % set the images in the grid positions for the current trial
        curStim = 1;
        while curStim <= length(trialInfo{trialNum})
            imageStim = imageStimsMap(trialInfo{trialNum}{curStim});
            imageStim.destRect = fitDestRect(gridRectMap(trialInfo{trialNum}{curStim+1}), imageStim.destRect);
            
            % draw the image stim to the screen...
            drawImageStim(window, imageStim);
            curStim = curStim + 2;
        end

        % play a beep
        Beeper();
        
        % display the screen buffer (what we drew)
        displayWindow(window);
        
        % pause
        WaitSecs(interTrialDelay);
        
        % record audio...
        responseTime = recordAudioFromMicrophoneUntilSpaceKey(participantId, audioRecordingLength, ['above_below_trial_' participantId '_' num2str(trialNum)]);
    end
    
    % we are finished...
    displayInstructions(window, 'Experiment Complete...');
    
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