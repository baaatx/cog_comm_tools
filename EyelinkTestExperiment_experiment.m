% EyelinkTestExperiment_experiment.m - A simple test experiment for learning how to work with the Eyelink
% equipment.
%
% Make sure the Eyelink host computer is turned on and running the eyelink
% program before running this script or it will error out.
%
% Author: Brian Armstrong
%

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

% constants
waitTime = 2.00;
dt = 0.5;
screenPadding = 20;

% here we are specifying what screen resolution we want
screenResolution = [1152 864];

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    participantId = 'exampleParticipantId';
    
    % this call initializes and makes a connection to the Eyelink Host
    % Computer... returns the eyelink defaults we need for calibration
    el = initializeEyelink(window, resolution);
    
    % display some instructions... 
    displayInstructions(window, 'Please pick up the joystick.',dt,'joystick');
    
    % Calibrate the eye tracker
    displayInstructions(window, 'Now we will calibrate the EyeTracker.',dt,'joystick');
    EyelinkDoTrackerSetup(el);
    
    % do a final check of calibration using driftcorrection
    displayInstructions(window, 'Now we perform a quick Drift Correction.', dt, 'joystick');
    EyelinkDoDriftCorrection(el);
    
    displayInstructions(window, 'You will see cross-hairs appear at different\n\npositions on the screen.\n\nJust look at the cross-hairs as they move around. ', dt, 'joystick');
    clearWindow(window);
    
    EyelinkOpenFile('elTest.edf');
    
    % The TRIAL
    %
    % Just want to track the eyes while asking the participant to follow
    % the crosshairs on the screen.
    
    % the call that starts recording data...
    EyelinkStartRecording();
    
    % give the Eyelink Equipment a chance to start recording
    WaitSecs(dt);
    
    % draw the cross hairs on various positions on the screen, and log
    % the times when presented. Wait between each draw.
    
    % display the cross hair for the first time...
    displayCrossHairsCentered(window);
    
    % mark zero-plot time in data file
    EyelinkSyncTime();
    WaitSecs(waitTime);

    % display the CrossHairs in various positions with delays in between...
    displayCrossHairs(window, screenPadding, screenPadding);
    WaitSecs(waitTime);
        
    displayCrossHairs(window,  resolution.width-screenPadding,  resolution.height-screenPadding);
    WaitSecs(waitTime);
        
    displayCrossHairsCentered(window);
    WaitSecs(waitTime);
    
    displayCrossHairs(window,  resolution.width-screenPadding,  screenPadding);
    WaitSecs(waitTime);
    
    displayCrossHairs(window,  screenPadding, resolution.height-screenPadding);
    WaitSecs(waitTime);    
    
    displayCrossHairsCentered(window);
    WaitSecs(waitTime);
    
    % send eyelink host machine command to stop recording...
    EyelinkStopRecording();
    
    % blank out the screen...
    clearWindow(window);
    
    % transfer the file to the display machine...
    EyelinkSaveFile('elTest.edf', participantId);
    
    % end of the TRIAL
    displayInstructions(window, 'Experiment Completed... ');
    
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