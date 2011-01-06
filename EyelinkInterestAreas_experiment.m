% EyelinkInterestAreas_example.m - An example experiment using areas of
% interest and Joystick input.
%
% Author: Brian Armstrong
%

% import cog_comm_tools MATLAB package so we can use its functions and classes.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

% specify the screen resolution
screenResolution = [1152 864];

% declare any experimental constants
dt = 1.2;

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style 
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
        
    % initilze the participant information
    participantId = initializeParticipant(window);
    %participantId = 'exampleParticipantId';
    
    % Things to do before eyelink calibration is called.
    ListenChar(2);
    commandwindow;
    
    % make connection with Eyelink
    initializeEyelink(window, resolution);

    % init Eyelink default values
    el = EyelinkInitDefaults(window);
    
    % DEFINE IMAGE STIMS
    x1 = ImageStim('x1', 'stimuli/images/redBall.jpg', 200, 200 , 'red ball');
    x2 = ImageStim('x2', 'stimuli/images/blueTriangle.jpg', 900, 700 , 'triangle');
    
    x3 = ImageStim('x3', 'stimuli/images/babyChicken.jpg', 250, 400, 'Baby Chicken');
    x4 = ImageStim('x4', 'stimuli/images/armadillo-purse.jpg', 825, 220, 'armadillo-purse');
    
    x5 = ImageStim('x5', 'stimuli/images/pinkSquare.jpg', 300, 300, 'pink square');
    x6 = ImageStim('x6', 'stimuli/images/silverInfinity.jpg', 900, 440, 'silver infinity');
        
    x7 = ImageStim('x7', 'stimuli/images/orangeHexagon.jpg', 200, 400, 'orange hexagon');
    x8 = ImageStim('x8', 'stimuli/images/redCross.jpg', 800, 400, 'red cross');
    
    % create a new map object (a data structure that lets you access
    % elements by a string key.)
    imageStimsMap = containers.Map();
    
    % add the image stimuli to the map by keyCode (so its easy to refer to
    % which stim you want...)
    imageStimsMap(x1.keyCode) = x1;
    imageStimsMap(x2.keyCode) = x2;
    imageStimsMap(x3.keyCode) = x3;
    imageStimsMap(x4.keyCode) = x4;
    imageStimsMap(x5.keyCode) = x5;
    imageStimsMap(x6.keyCode) = x6;
    imageStimsMap(x7.keyCode) = x7;
    imageStimsMap(x8.keyCode) = x8;

    % DEFINE SOME additional per TRIAL DATA
    
    % desired ID for each trial
    trialIds = {'1', '2', '3', '4'};
    
    % stims used in each trial
    trialStims= { {'x1', 'x2'}
                  {'x3', 'x4'}
                  {'x5', 'x6'}
                  {'x7', 'x8'} };
    
    % text used in each trial
    trialText = {'three dimensional' , 'an animal' , 'biggest', 'medical'};              
        


    % RUN THE EXPERIMENT
    % Start a logger
    myLog = TDFLog(['participants/' participantId '/eyelinkIATest.txt']);
    
    % set calibration colors to white on black
    el = EyelinkSetCalibrationColors(el);
    
    % Calibrate the eye tracker
    displayInstructions(window, 'Now we will calibrate the EyeTracker.');
    EyelinkDoTrackerSetup(el);
    
    % do a final check of calibration using driftcorrection
    displayInstructions(window, 'Now we will calibrate the EyeTracker\n\n(Drift Correction)');
    EyelinkDoDriftCorrection(el);

     % re-initilize the window because calibration changes its settings...
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    % clear the window
    clearWindow(window);
    
    % PERFORM TRIALS
    displayInstructions(window, 'Please pick up the joystick.', 0.5, 'joystick');
    displayInstructions(window, 'Text will appear in the center of the screen, along with images displayed on the left or right side of the screen.\n\nDecide which side of the screen contains the image\nmatching the text, and press the corresponding left or right trigger button on the joystick.', 2, 'joystick');
    displayInstructions(window, 'Start each trial by looking at the crosshairs in the center of the screen...\n\nDo you understand the instructions?', 2, 'joystick');
    
    Eyelink('OpenFile','iaTest.edf')
        
    numTrials = 4;
    currentTrial = 1;
    
    while(currentTrial <= numTrials)

        % get image stims ready
        leftImageStim = imageStimsMap(trialStims{currentTrial}{1});
        rightImageStim = imageStimsMap(trialStims{currentTrial}{2});
        
        displayInstructions(window, 'Prepare for next trial...', 0.5, 'joystick');
        
        % show fixation point
        displayCrossHairsCentered(window);
        WaitSecs(dt);
        
        % start recording to the EDF file
        EyelinkStartRecording();
    
        % let eyelink record some samples before syncing up the time...
        WaitSecs(dt);
        
        % Set this trial Id
        EyelinkSetTrialId(trialIds{currentTrial});
        
        % set two areas of interest for the left and right images...
        EyelinkSetIAFromImageStim(1, 'leftImage', leftImageStim)
        EyelinkSetIAFromImageStim(2, 'rightImage', rightImageStim)
        
        % draw the text and image stims onto the screen...
        drawImageStim(window, leftImageStim);
        drawImageStim(window, rightImageStim);
        drawTextCentered(window, trialText{currentTrial});
        
        % this call refreshes the screen with the draw commands above.
        drawWindow(window);

        % now the images and text are on the screen...

        % Sync time (set zero time point)
        EyelinkSyncTime();
        
        % record in EDF when display stim was on screen
        EyelinkDisplayOn();

        % wait for left or right joystick press.
        [answer, responseTime] = joystickLeftRightDialog();

        % log the data - button pressed and response time
        myLog.add(num2str(answer));
        myLog.add(num2str(responseTime));
        
        % end the log row since the trial is over...
        myLog.nextRow();

        % end trial in Eyelink Data
        EyelinkTrialOk();        
        EyelinkStopRecording();
        
        % increment the trial counter...
        currentTrial = currentTrial + 1;
    end

    displayInstructions(window, 'Example Experiment Completed...', 1, 'joystick');
    
    % Save the recorded eyelink EDF file on the display pc
    EyelinkSaveFile('iaTest.edf', participantId);
        
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