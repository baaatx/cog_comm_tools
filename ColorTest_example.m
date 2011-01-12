% ColorTest_example.m - An example that cycles through font / background
% colors...
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

incValue = 10;

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

    displayInstructions(window, 'This is a color test. Hit ESC to exit once the test begins...');
    
    % keep going until exit
    while(true)
        
        red = 0;
        green = 0;
        blue = 0;        
        
        % cycle through all the colors by fifteen
        for red=0:15:255
            for green=0:15:255
                for blue=0:15:255

                    % string of the color...
                    colorString = ['[' num2str(red) ' ' num2str(green) ' ' num2str(blue) ']'];
                    
                    % RGB color value...
                    fontColor = [red green blue];
                    
                    % display the text...
                    displayTextCentered(window, colorString, fontColor);

                    % allow for exit...
                    checkForEscapeKeyToHalt();
                end
            end
        end
    end
    
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