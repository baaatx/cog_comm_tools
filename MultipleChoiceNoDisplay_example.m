% MultipleChoiceNoDisplay_example.m - an example of how to perform a
% keyboard dialog with a custom display.
% 
%
% Author: Brian Armstrong

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

% define the screen resolution the experiment is going to run on. [x y]
screenResolution = [1920 1080];
%screenResolution = [1152 864];
%screenResolution = [800 600];

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, 
    % save the window pointer and the resolution structure
    [window, resolution ] = initializeWindow(fontFace, fontSize, fontStyle, screenResolution );

    % screen mid point coordinates
    midX = resolution.width / 2;
    midY = resolution.height / 2;
    
    % DISPLAY INSTRUCTIONS
    displayInstructions(window, 'An image will appear on the screen centered on the screen.  Press a number key (1-0) for (1-10) to rate how much you like the image..');

    % DEFINE STIMULI
    % create image stimuli objects (encapsulates data for still image stimuli)
    imageStim = ImageStim('x0', 'stimuli/images/redBall.jpg', midX, midY, 'red ball');
    
    % draw some test to the screen.
    drawTextAtPosition('Press a number 1 2 3 4 5 6 7 8 9 (1)0 to rate how much you like this picture.', 20,20); 
    
    % draw the image in its initial position
    drawImageStim(window, imageStim);
    
    % display what we have drawn to the window
    displayWindow(window);
    
    % Set up choice list for multiple choice dialog.
    % Allow them to press 1-0 for values 1-10.
    
    % Each Choice object is of type Choice(keyCode, value)
    one = Choice('1',1);
    two = Choice('2',2);
    three = Choice('3',3);
    four = Choice('4',4);
    five = Choice('5',5);
    six = Choice('6',6);
    seven = Choice('7',7);
    eight = Choice('8',8);
    nine = Choice('9',9);
    ten = Choice('0',10);
        
    choiceList = [one two three four five six seven eight nine ten];
    
    % maximum number of seconds allowed before the dialog continues ( it
    % will return 'noneSelected' after this amount of time if no answer is
    % chosen.
    timeOutInSeconds = 15;
    
    [answer, responseTime] = multipleChoiceDialogNoDisplay(choiceList, timeOutInSeconds);
    
    displayInstructions(window, ['You selected ' num2str(answer) ' after ' num2str(responseTime) ' seconds.']);
    
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