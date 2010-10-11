% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% DEFINE EXPERIMENT CONSTANTS

% amount of time images are displayed.
imageDisplayTime = 2.0;

% time for a short pause
dt = 0.2;

% how long to record for
recordingLength = 2.00; 

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

% define the screen resolution the experiment is going to run on. [x y]
screenResolution = [800 600];

% store start time
startTime = GetSecs();

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS -
    % save the window pointer and the resolution structure
    [window, resolution ] = initializeWindow(fontFace, fontSize, fontStyle, screenResolution );
    
    % initilze the participant
    participantId = initializeParticipant(window);
    
    % run the full sound check since we are recording audio from the
    % participant with a microphone
    fullSoundCheck(window, participantId);
    
    % Setup our log.  
    myLog = TDFLog(['participants/' participantId '/imageSayLog.txt']);
    myLog.add('Image');
    myLog.add('StartTime');
    myLog.add('StopTime');
    myLog.nextRow();
        
    % DISPLAY INSTRUCTIONS
    displayInstructions(window, 'You will see a series of images displayed on the screen.\n\nWhen you see ''Go!'' flash on the screen, say the first word that comes to your mind.\n\nWhen you are finished speaking, press the space bar on the keyboard. This will continue until the experiment has completed.\n\n Do you have any questions?  ' , 1);

    % DEFINE STIMULI
    % create image stimuli objects (encapsulates data for image stimuli)
    s1 = ImageStim('x0', 'stimuli/images/redBall.jpg', 1, 0, 0);
    s2 = ImageStim('x1', 'stimuli/images/blueTriangle.jpg', 1, 0, 0);
    s3 = ImageStim('x2', 'stimuli/images/pinkSquare.jpg', 0, 0, 0);
    s4 = ImageStim('x3', 'stimuli/images/orangeHexagon.jpg', 1, 0, 0);
    s5 = ImageStim('x4', 'stimuli/images/silverInfinity.jpg', 1, 0, 0);
    s6 = ImageStim('x6', 'stimuli/images/blackSix.jpg', 0, 0, 0);
    s7 = ImageStim('x7', 'stimuli/images/redCross.jpg', 1, 0, 0);
    
    % the array of image stimuli objects
    imageStimList = [s1 s2 s3 s4 s5 s6];
    
    % randomize the order of image stimuli objects
    imageStimList = shuffleArray(imageStimList);
    
    % RUN TRAINING
    % Does this experiment have a training section? If so, it probably
    % would go here just before the trials.
    
    % RUN TRIALS
    % for each image stim, display it (using image data), then flash a prompt for the
    % subject to talk, and record what they say.
    for i=1:length(imageStimList)
        % Get the ith stim
        imageStim = imageStimList(i);
        imageData = imageStim.imageData;
        imageKey = imageStim.key;
        
        % logging
        myLog.add(imageKey);

        % flash to prompt for audio input
        flashStringOnScreen(window, imageStim.key, dt, dt);
        
        % log display start time
        myLog.add(num2str(getSecs()-startTime));
                
        % display it for 'imageDisplayTime' seconds.
        displayImageDataCenteredAndWait (window, imageData, imageDisplayTime);
                
        % flash to prompt for audio input
        flashStringOnScreen(window, 'Go!', dt, dt);
        
        % record audio
        recordAudioFromMicrophoneUntilSpaceKey(participantId, [imageKey '.wav'] , recordingLength);

        % log display stop time
        myLog.add(num2str(getSecs()-startTime));
        
        % moves log to next row of tab delmited strings
        myLog.nextRow();
        
        % check if we are trying to halt the experiment.
        checkForEscapeKeyToHalt();
    end

    % tell them it is almost over
    displayInstructions(window, 'That completes the experiment! Thanks for your participation! Now we have a few quick exit questions for you to anwser. Your feedback is important to us.' , 1);
    
    % DEBRIEFING
    questionFile = 'SeeImageQuestions';
    questionText = 'Did You Enjoy Participating in This Experiment?';
    askQuestionAndSaveAnswer(window, questionFile, questionText, participantId);

    questionText = 'Did you have to think much before speaking the first thing that came to your mind?';
    askQuestionAndSaveAnswer(window, questionFile, questionText, participantId);

    questionText = 'Would you be willing to participant in similar experiments in the future?';
    askQuestionAndSaveAnswer(window, questionFile, questionText, participantId);
    
    % say goodbye
    showInstructions(window, 'That is all! Thanks for your participation! ' , 1);
    
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