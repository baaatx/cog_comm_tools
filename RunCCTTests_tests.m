% RunCCTTests_tests.m - Test cog_comm_tools package functions.
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
textColor = getRGBColor('black');

% here we are specifying what screen resolution we want
screenResolution = [1152 864];

% declare experimental constants

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution, textColor);
    
    participantId = 'exampleParticipantId';
 
    minX = 0;
    minY = 0;
    maxX = resolution.width;
    maxY = resolution.height;
    rows = 2;
    columns = 1;
    paddingWidth = 50;
    forceSquare = true;
    gridDestRects = getScreenGridRects(minX, maxX, minY, maxY, rows, columns, paddingWidth, forceSquare);
    
    xPos = 20;
    yPos = 20;
    dt = 0.01;
    midX = resolution.width / 2;
    midY = resolution.height / 2;
    fullScreenDestRect = [0 0 resolution.width resolution.height];
    
    imageFileName = 'stimuli/images/redBall.jpg';
    audioFileName = 'stimuli/audio/gatsby.wav';
    %movieFileName = ' stimuli/video/waucissa.mov';
    
    imageStim = ImageStim('redBall', imageFileName, midX , midY ,'redBall');
    audioStim = AudioStim('gatsby', audioFileName, 'gatsby');
    
    imageStims = [imageStim imageStim];
    imagesData = {imageStim.imageData, imageStim.imageData};
    imageFileNames = {imageFileName, imageFileName};
    
    exampleText = 'O Catiline, do you mean to cease abusing our patience? How long is that madness of yours still to mock us? When is there to be an end of that unbridled audacity of yours, swaggering about as it does now? Do not the nightly guards placed on the Palatine Hill—do not the watches posted throughout the city—does not the alarm of the people, and the union of all good men—does not the precaution taken of assembling the senate in this most defensible place—do not the looks and countenances of this venerable body here present, have any effect upon you? Do you not feel that your plans are detected? Do you not see that your conspiracy is already arrested and rendered powerless by the knowledge which every one here possesses of it? What is there that you did last night, what the night before—where is it that you were—who was there that you summoned to meet you—what design was there which was adopted by you, with which you think that any one of us is unacquainted?';
        
    %run draw tests.
    drawTextCentered(window, exampleText);
    displayWindow(window);    
    
    drawImageAtDestRect(window, imageFileName, fullScreenDestRect);
    displayWindow(window);
    
    drawImageStim(window, imageStim);
    displayWindow(window);
    
    drawImageStimWithTitle(window, imageStim);
    displayWindow(window);    
    
    drawImageStimsWithTitle(window, imageStims);
    displayWindow(window);    
    
    drawTextCentered(window, exampleText);
    displayWindow(window);    
    
    drawImageDataAtDestRect(window,imageStim.imageData, fullScreenDestRect);
    displayWindow(window);    
    
    drawImageStimCentered(window, imageStim);
    displayWindow(window);    
    
    drawImageStims(window, imageStims);
    displayWindow(window);    
    
    drawTextAtPosition(window, exampleText, xPos, yPos);
    displayWindow(window);

    % run display tests
    displayCrossHairs(window, xPos, yPos);
    displayImageDataCenteredAndWait(window, imageStim.imageData, dt);
    displayCrossHairsCentered(window);
    displayImageStim(window, imageStim);
    displayTextAtPosition(window, exampleText, xPos, yPos);
    displayImageAtDestRect(window, imageFileName, fullScreenDestRect);
    displayImageStimAtPosition(window, imageStim, xPos, yPos);
    displayTextCentered(window, exampleText);
    displayImageCentered(window, imageFileName);
    displayImageStimCentered(window, imageStim);
    displayTextCenteredAndWait(window, exampleText, dt);          
    displayImageCenteredAndWait(window, imageFileName, dt);
    displayImageStimWithTitle(window, imageStim);
    displayImageStims(window, imageStims);
    displayImageDataCentered(window, imageStim.imageData);
    displayImageDataAtDestRect(window, imageStim.imageData, fullScreenDestRect);
    displayMultipleImageDataAtDestRects(window, imagesData, gridDestRects);
    displayImageStimsAtDestRects(window, imageStims, gridDestRects);         
    displayImagesAtDestRects(window, imageFileNames, gridDestRects);
    
    % these require input feedback.
    drawTextAtPosition(window, 'press space key', xPos, yPos);
    displayImageCenteredUntilSpaceKey(window, imageFileName);
    
    drawTextAtPosition(window, 'press space key', xPos, yPos);
    displayTextCenteredUntilSpaceKey(window, exampleText);
   
    drawTextAtPosition(window, 'click mouse button', xPos, yPos);
    displayImageCenteredUntilMouseClick(window, imageFileName);
    
    displayInstructions(window, exampleText, dt);
    
    waitUntilNoKeysPressed();

    displayTextCentered(window, 'testing audio playback');
    playAudioStimAndContinue(audioStim);
    displayTextCentered(window, '(audio playing)');

    displayInstructions(window, 'Tests Completed...', dt);
    
    % SHUTDOWN THE EXPERIMENT
    shutDownExperiment();
%
% It is okay that the catch statement shows as a warning in MATLAB.
% We don't want to catch the exception...
%
catch 
    % This "catch" section executes in case of an error in the "try" section above.
    % If we encounter an exception, we clean up.

    % Clean up.
    shutDownExperiment();
        
    % Since we are catching (handling) the error, we want to rethrow it so we can see
    % what happened. We only catch it to call shutDownExperiment.
    psychrethrow(psychlasterror);
end