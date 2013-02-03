% ScriptTemplate_experiment.m - A template for scripting (testing code or
% writing short (non-experiment)) scripts and examples using cog_comm_tools.
%
% Author: Brian Armstrong
%

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

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
        
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    drawTextCentered(window, 'testing text');
    displayWindow(window);
    
    KbWait();
    
    
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