% TextAndBackgroundColors_example.m - An example showing how to set font
% color and background screen color.
%
% Author: Brian Armstrong
%

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;
fontColor = getRGBColor('red');

% here we are specifying what screen resolution we want(uncomment an
% option, or specify a valid resolution for the machine you are working on)
  screenResolution = [1024 768];
% screenResolution = [1152 864];
% screenResolution = [1920 1080];

% declare experimental constants

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
        
    % initilize the window, set font style
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution, fontColor);
    
    % notice we don't supply any optional arguments. See the code for
    % displayInstructions to see all the paramenters.
    displayInstructions(window, 'These Instructions are in red because we set the default fontColor for window to red. If no background color is specified, the background will be the complement color of the text color.');
    
    % notice you need to supply more optional arguments (delay and continue
    % type) in order to pass in the background color and font color.
    displayInstructions(window, 'But we can also specify what colors to use when displaying instructions.\n\nHere we set font color to gray and fill with a black background...', 1, 'keyboard', getRGBColor('black'), getRGBColor('gray'));
    
    displayTextAtPosition(window, 'Here is some text displayed on its own at (50,50). It is gray because the last time we drew text was with gray...\n\n(So if you draw text in different colors, you might want to reset the font color to your original color...\n\n(Press any Key)', 50, 50);
    
    % wait a second, then wait for keyboard input
    WaitSecs(1);
    KbWait();
    
    % set the font color back to red (this is done during
    % initializeWindow)
    Screen('TextColor', window, getRGBColor('red'));
    
    displayInstructions(window, 'Now we see the text is red again because we used the PTB Screen command to set the color to red...\n\nNotice we used getRGBColor which will give you the color matrix for several basic colors (as strings like ''blue'' or ''maroon'')...\n\n If you want a specific color you can specify its RGB value as a 1x3 matrix such as\n\nwhite = [255 255 255]\n\nfor white.  Each value is 0-255 (8bit) unsigned integer.');
    
    displayInstructions(window, 'You can use getColorComplement to get the ''opposite'' color, which can be handy for picking a background color. (Note: Gray does not have an opposite color in this since.)', 1, 'keyboard', getColorComplement(getRGBColor('teal')), getRGBColor('teal'));
    
    % fill the window with maroon before drawing any text...
    fillWindow(window, getRGBColor('maroon'));
    
    % this is a draw function, which just draws to the video buffer but
    % doesn't display the updated buffer to the screen...
    Screen('TextColor', window, getRGBColor('lightgray'));
    drawTextAtPosition(window, 'Here is some drawn text at (50,50). Notice the background is maroon, because we filled the window with maroon before drawing the text...\n\nWhen drawing images and text to the screen, you just need to fill the window with an image or a color to have a ''background''...\n\n(press any key)' , 50, 50);
    
    % this call puts the screen buffer (what we draw to) onto the screen...
    displayWindow(window);

    % wait a second, then wait for keyboard input
    WaitSecs(1);
    KbWait();
    
    % set the font color to cobalt blue
    Screen('TextColor', window, getRGBColor('cobalt'));
        
    displayInstructions(window, 'Now the font color is cobalt blue... Now we will demonstrate the fade to black function...');
    
    % a fading out function
    fadeWhiteToBlack(window);
    
    displayInstructions(window, 'And now the fade black to white function....', 1, 'keyboard', getRGBColor('black'));
    
    % a fading in function
    fadeBlackToWhite(window);
    
    % set the font color to cobalt blue
    Screen('TextColor', window, getRGBColor('orange'));
        
    displayInstructions(window, 'You can set the background color when using multiple choice dialogs by simply calling fillWindow just before you call the dialog function...', 1, 'keyboard', getRGBColor('black'));
    
    % Setup multiple choice question choices...
    choiceList = [Choice('a', '1') Choice('b', '2')];
    
    % start the multiple Choice Dialog
    fillWindow(window, getRGBColor('black'));
    [answer, responseTime]  = multipleChoiceDialog(window, 'Which number is bigger (example question)?' , choiceList);
        
    displayInstructions(window, 'See, adding color to your experiment is easy...');
    
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