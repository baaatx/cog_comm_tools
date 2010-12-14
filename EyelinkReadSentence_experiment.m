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
screenResolution = [1152 864];

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    sentenceStim = ImageStim('s1', 'stimuli/images/sentence_at_1152_864.jpg', 0, 0 , 'sentence 1');
    
    participantId = 'exampleParticipantId';
    
    % this call initializes and makes a connection to the Eyelink Host
    % Computer... returns the eyelink defaults we need for calibration,
    % etc...
    el = initializeEyelink(window, resolution);
    
    % Calibrate the eye tracker
    displayInstructions(window, 'Now we will calibrate the EyeTracker.\n During Calibration, you want to look into the\ncenter of the circle that appears on the screen.\n\n If nothing happens after looking at it for\n a few seconds, press the ENTER key.');
    EyelinkDoTrackerSetup(el);
    
    % do a final check of calibration using driftcorrection
    displayInstructions(window, 'Now we will calibrate the EyeTracker\n\n(Drift Correction)');
    EyelinkDoDriftCorrection(el);
            
    % re-initialze the window for the experiment, since the calibration
    % takes it over and changes its properties.
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    displayInstructions(window, 'Please pick up the joystick', 0.3, 'joystick');
    displayInstructions(window, 'When the sentence appears on the screen, read it and then press any button on the joystick when you are finished reading.', 0.3, 'joystick');
    clearWindow(window);

    Eyelink('OpenFile','senTest.edf');
        
    % The TRIAL
    displayCrossHairsCentered(window);
    
    % the call that starts recording eyelink data...
    EyelinkStartRecording();
    
    EyelinkSetOverlayImage('sentence_at_1152_864.jpg');
    
    % give the Eyelink Equipment a chance to start recording
    WaitSecs(dt);
    
    % draw the cross hairs on various positions on the screen, and log
    % the times when presented. Wait between each draw.

    % mark zero-plot time in data file
    EyelinkSyncTime();
    WaitSecs(waitTime);
    
    displayImageStimCentered(window, sentenceStim);
    EyelinkDisplayOn();
    
    joystickWaitForButton();
        
    EyelinkStopRecording();
    
    clearWindow(window);
    
    EyelinkSaveFile('senTest.edf', participantId);
    
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