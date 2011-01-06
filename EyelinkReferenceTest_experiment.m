% EyelinkTestExperiment_experiment.m - A test experiment for learning how to work with the Eyelink
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
dt = 0.02;

% here we are specifying what screen resolution we want
%screenResolution = [1152 864];
%screenResolution = [115200 86400];

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    participantId = 'exampleParticipantId';
    
    % this call initializes and makes a connection to the Eyelink Host
    % Computer... returns the eyelink defaults we need for calibration,
    % etc...
    el = initializeEyelinkHREF(window, resolution);

    % Calibrate the eye tracker
    displayInstructions(window, 'Now we will calibrate the EyeTracker.\n During Calibration, you want to look into the\ncenter of the circle that appears on the screen.\n\n If nothing happens after looking at it for\n a few seconds, press the ENTER key.');
    
    EyelinkDoTrackerSetup(el);
    
    % do a final check of calibration using driftcorrection
    displayInstructions(window, 'Now we will calibrate the EyeTracker\n\n(Drift Correction)');
    EyelinkDoDriftCorrection(el);
            
    % re-initialze the window for the experiment, since the calibration
    % takes it over and changes its properties.
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    displayInstructions(window, 'Roll your head around, but stay fixated on cross-hairs. ');
    clearWindow(window);
    Eyelink('OpenFile','refTest.edf')
    
    % The TRIAL
    %
    % Just want to track the eyes while asking the participant to follow
    % the crosshairs on the screen.
    
    % the call that starts recording data...

    Eyelink('Command', 'simulate_head_camera = OFF');
    Eyelink('Command', 'marker_control = OFF');
    Eyelink('StartRecording');
    
    % give the Eyelink Equipment a chance to start recording
    WaitSecs(dt);
        
    % mark zero-plot time in data file
    Eyelink('Message', 'SYNCTIME');
    
    WaitSecs(waitTime);
            
    displayCrossHairsCentered(window);
    
    WaitSecs(2.00);
    
    EyelinkMicOn();
    
    WaitSecs(2.00);
    
    EyelinkMicOff();

    WaitSecs(2.00);
    
    EyelinkMicOn();
    
    WaitSecs(2.00);
    
    EyelinkMicOff();
    
    WaitSecs(2.00);
    
    EyelinkMicOn();
    
    WaitSecs(2.00);
    
    EyelinkMicOff();
        
    Eyelink('StopRecording');
    Eyelink('Command', 'marker_control = ON');
    
    beep();
    
    clearWindow(window);
    
    EyelinkSaveFile('refTest.edf', participantId);
    
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