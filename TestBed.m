%  TestBed.m has snippets of code testing the latest new features.
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
screenResolution = [1920 1080];

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
        someImages = {'stimuli/images/redBall.jpg', 'stimuli/images/blackSix.jpg', 'stimuli/images/blueTriangle.jpg', 'stimuli/images/pinkSquare.jpg', 'stimuli/images/silverInfinity.jpg'};
    
    imageData = cell(1,4);
    
    imageData{1} = imread(char('stimuli/images/redBall.jpg'));
    imageData{2} = imread(char('stimuli/images/blackSix.jpg'));
    imageData{3} = imread(char('stimuli/images/blueTriangle.jpg'));
    imageData{4} = imread(char('stimuli/images/silverInfinity.jpg'));
    
    rows = 15;
    columns = 15;
    theImageData = cell(1, rows*columns);
    %imageFileNames = cell(1,rows*columns);
    for i=1:(rows*columns)
        theImageData{i} = imageData{randi(length(imageData)-1)+1};
    end
        
    %imageFileNames = {'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg', 'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg' ,  'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg',  'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg' ,  'stimuli/images/redBall.jpg', 'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg', 'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg' ,  'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg',  'stimuli/images/redBall.jpg'};
    destRects1 = simpleGetScreenGridRects(resolution.width, resolution.height, rows, columns, false);
    destRects2 = getScreenGridRects(0,resolution.width, 0, resolution.height, rows, columns, 0, false);
    
    disp (isequal(destRects1, destRects2));
    
    disp (destRects1);
    disp (destRects2);
    
    s = tic();
    %displayImagesAtDestRects(window, imageFileNames, destRects);
    displayMultipleImageDataAtDestRects(window, theImageData, destRects1);
    e = toc(s);
    
    %disp (e);
    
    KBWait();
        
    %fullSoundCheck(window, subjectid);
    
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