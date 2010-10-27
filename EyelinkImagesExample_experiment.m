% EyelinkImagesExample_experiment.m - A test experiment for learning how to work with the Eyelink
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
waitTime = 8.00;
dt = 5.02;

% here we are specifying what screen resolution we want
screenResolution = [1152 864];

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
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
    
    el = initializeEyelink(window, resolution);

    % create a new logger
    myLog = TDFLog(['participants/' participantId '/eliTest.txt']);
    
    % Calibrate the eye tracker
    %displayInstructions(window, 'Now we will calibrate the EyeTracker.\n During Calibration, you want to look into the\ncenter of the circle that appears on the screen.\n\n If nothing happens after looking at it for\n a few seconds, press the ENTER key.');
    %EyelinkDoTrackerSetup(el);
    
    % do a final check of calibration using driftcorrection
    %displayInstructions(window, 'Now we will calibrate the EyeTracker\n\n(Drift Correction)');
    %EyelinkDoDriftCorrection(el);
            
    % re-initialze the window for the experiment, since the calibration takes it over.
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    displayInstructions(window, 'Look at the images back and forth...');
 
    % Define stim images
    s1 = ImageStim('x0', 'stimuli/images/redBall.jpg', 180,180, 'Red Ball');
    s2 = ImageStim('x1', 'stimuli/images/babyChicken.jpg', 700,300, 'Baby Chicken');
        
    Eyelink('OpenFile','eliTest.edf')

    % The TRIAL
        
    % the call that starts recording data...
    Eyelink('StartRecording');
    Eyelink('Message', 'TRIALID 1');
    Eyelink('Message', '!V IAREA FILE lr.ias');
    
    % give the Eyelink Equipment a chance to start recording
    WaitSecs(dt);
        
    startTime = GetSecs();
    
    drawImageStim(window, s1);
    drawImageStim(window, s2);
    drawWindow(window);
        
    % mark zero-plot time in data file
    Eyelink('Message', 'SYNCTIME');
    
    WaitSecs(waitTime);
        
    Eyelink('StopRecording');
    
    clearWindow(window);
    
    EyelinkSaveFile('eliTest.edf', participantId);
    
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