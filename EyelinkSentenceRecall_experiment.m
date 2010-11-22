% EyelinkSentenceRecall_experiment.m - 
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
audioBufferLength = 17.25;

% here we are specifying what screen resolution we want
% (set to same as Display PC res)
screenResolution = [1152 864];

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    % get info about participant and experimenter and room
    participantId = initializeParticipant(window);
    %participantId = 'exampleParticipantId';
        
    % SETUP STIM DATA
    audioStimsMap = containers.Map();
    
    audioStimsMap('s1') = AudioStim('s1', 'stimuli/audio/hitchhikers.wav', 's1');
    audioStimsMap('s2') = AudioStim('s2', 'stimuli/audio/gatsby.wav', 's1');
    stimOrder = {'s1', 's2'};
    
    % this call initializes and makes a connection to the Eyelink Host
    % Computer...(AND SETS UP HREF MODE) returns the eyelink defaults we need for calibration,
    % etc...    
    el = initializeEyelinkHREF(window, resolution);

    % create a new logger
    myLog = TDFLog(['participants/' participantId '/stryTest.txt']);
    
    % Calibrate the eye tracker
    displayInstructions(window, 'Now we will calibrate the EyeTracker.\n During Calibration, you want to look into the\ncenter of the circle that appears on the screen.\n\n If nothing happens after looking at it for\n a few seconds, press the ENTER key.');
    
    EyelinkDoTrackerSetup(el);
    
    % do a final check of calibration using driftcorrection at the start of
    % each trial...
    
    displayInstructions(window, 'Now we will calibrate the EyeTracker\n\n(Drift Correction)');
    EyelinkDoDriftCorrection(el);
            
    % re-initialze the window for the experiment, since the calibration
    % takes it over and changes its properties.
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    displayInstructions(window, 'Please Pick Up The Joystick', dt, 'joystick');
    
    displayInstructions(window, 'You will hear a sentence read out load.  After you hear the beep, press a button on the joystick to continue... Then you are to retell the story as best as you can remember it.  Press a button on the joystick when you are done telling the story. Understand?', dt, 'joystick');
    
    clearWindow(window);
    
    Eyelink('OpenFile','stryTest.edf')
    
    % The TRIALs
    %
    % Just want to track the eyes while asking the participant to follow
    % the crosshairs on the screen.
    currentTrial = 1;
    
    while (currentTrial <= length(stimOrder))
        % get the audio stim to play
        audioStim = audioStimsMap(stimOrder{currentTrial});
        
        myLog.add(participantId);
        myLog.add(audioStim.keyCode);
        
        % play a beep
        Beeper();
        
        displayInstructions(window, 'Prepare to listen to the story', dt, 'joystick');
        clearWindow(window);
        
        % play a beep
        Beeper();
        
        % the call that starts recording data...
        EyelinkStartRecording();
        
        trialId = [num2str(currentTrial) '_listening'];
        
        % set the trial ID in the EDF file
        EyelinkSetTrialId(trialId);

        % give the Eyelink Equipment a chance to start recording some
        % samples...
        WaitSecs(dt);
        
        % RECORD WHILE THEY LISTEN

        displayTextCentered(window, 'listen to the sentence');
                
        % mark zero-plot time in data file
        EyelinkSyncTime();
  
        % play the wav file
        playAudioStim( audioStim );
        clearWindow(window);
        
        % the trial is ok... (required at end of trial)
        EyelinkTrialOk();
        EyelinkStopRecording();
        
        % RECORD WHILE THEY SPEAK BACK
        Beeper();
        
        displayInstructions(window, 'Prepare to tell back the sentence', dt, 'joystick');
        clearWindow(window);
                
        % the call that starts recording data...
        EyelinkStartRecording();
        
        trialId = [num2str(currentTrial) '_speaking'];
        
        % set the trial ID in the EDF file
        EyelinkSetTrialId(trialId);

        % give the Eyelink Equipment a chance to start recording some
        % samples...
        WaitSecs(dt);
 
        % play a beep
        Beeper();
        
        displayTextCentered(window, 'tell back the story (press joystick button when done)');
        
        % mark zero-plot time in data file
        EyelinkSyncTime();
        
        % send the mic on message
        EyelinkMicOn();
        
        % record audio
        responseTime = recordAudioFromMicrophoneUntilJoystick(participantId, audioBufferLength, trialId);
        
        % send the mic off message
        EyelinkMicOff();
        
        clearWindow(window);
        
        % play a beep
        Beeper();
                
        % the trial ok... (required at end of trial)
        EyelinkTrialOk();
        EyelinkStopRecording();

        myLog.add(trialId);
        myLog.add(responseTime);
        myLog.nextRow();
        
        % end of the TRIAL
        currentTrial = currentTrial + 1;
    end

    EyelinkSaveFile('stryTest.edf', participantId);
    
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