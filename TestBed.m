% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

%screenResolution = [1920 1080];

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    %A = Choice('a', KbName('a'), 'Option A');
    %B = Choice('b', KbName('b'), 'Option B');
    %C = Choice('c', KbName('c'), 'Option C');
    
    %choiceList = [A B C];
        
    %answer = multipleChoiceDialog(window, 'Which One?' , choiceList);
    
    %disp (answer);
    
    %error ('stop');
    
    
    %someImages = {'stimuli/images/redBall.jpg', 'stimuli/images/blackSix.jpg', 'stimuli/images/blueTriangle.jpg', 'stimuli/images/pinkSquare.jpg', 'stimuli/images/silverInfinity.jpg'};
    
    %imageData = cell(1,4);
    
    %imageData{1} = imread(char('stimuli/images/redBall.jpg'));
    %imageData{2} = imread(char('stimuli/images/blackSix.jpg'));
    %imageData{3} = imread(char('stimuli/images/blueTriangle.jpg'));
    %imageData{4} = imread(char('stimuli/images/silverInfinity.jpg'));
    
    %rows = 15;
    %columns = 15;
    %theImageData = cell(1, rows*columns);
    %imageFileNames = cell(1,rows*columns);
    %for i=1:(rows*columns)
    %    theImageData{i} = imageData{randi(length(imageData)-1)+1};
    %end
        
    %imageFileNames = {'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg', 'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg' ,  'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg',  'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg' ,  'stimuli/images/redBall.jpg', 'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg', 'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg' ,  'stimuli/images/redBall.jpg' , 'stimuli/images/blackSix.jpg',  'stimuli/images/redBall.jpg'};
    %destRects = getScreenGridRects(resolution.width, resolution.height, rows, columns, true);
    
    %s = tic();
    %displayImagesAtDestRects(window, imageFileNames, destRects);
    %displayMultipleImageDataAtDestRects(window, theImageData, destRects);
    %e = toc(s);
    
    %disp (e);
    
    %KBWait();
    
    % initilze the subject
    subjectid = initializeSubject(window);

    %newMap = delimitedTextFileToStringArrays('stimuli/text/XXX-delimited-lines.txt','X\n');
    %disp (newMap);
    %disp (length(newMap));
    %error('done testing');
   
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