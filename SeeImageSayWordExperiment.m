% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% DEFINE EXPERIMENT CONSTANTS

% amount of time images are displayed.
imageDisplayTime = 1.0;

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
sT = tic();

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS -
    % save the window pointer and the resolution structure
    [window, resolution ] = initializeWindow(fontFace, fontSize, fontStyle, screenResolution );
    
    % initilze the subject
    participantId = initializeParticipant(window);
    %participantId = 'brian';

    % run the sound check since we are recording audio
    % fullSoundCheck(window, subjid);
    
    myLog = TDFLog(['participants/' participantId '/imageSayLog.txt']);
    myLog.add('Image');
    myLog.add('Start');
    myLog.add('Start');
    myLog.add('Stop');
    myLog.add('Stop');
    myLog.nextRow();
        
    % DISPLAY INSTRUCTIONS
    showInstructions(window, 'You will see a series of images displayed on the screen.\n\n When you see ''Go!'' flash on the screen, say the first word that comes to your mind.\n\n If you don not begin to speak soon enough, a beep will remind you to say something. \n\n Do you have any questions?  ' , 1);

    % DEFINE STIMULI
    % create image stimuli objects
    
    s1 = ImageStim('x0', 'stimuli/images/redBall.jpg', true, 0, 0);
    s2 = ImageStim('x1', 'stimuli/images/blueTriangle.jpg', true, 0, 0);
    s3 = ImageStim('x2', 'stimuli/images/pinkSquare.jpg', false, 0, 0);
    s4 = ImageStim('x3', 'stimuli/images/orangeHexagon.jpg', true, 0, 0);
    s5 = ImageStim('x4', 'stimuli/images/silverInfinity.jpg', true, 0, 0);
    s6 = ImageStim('x6', 'stimuli/images/blackSix.jpg', false, 0, 0);
    s7 = ImageStim('x7', 'stimuli/images/redCross.jpg', true, 0, 0);
    
    % the array of image stimuli objects
    imageStimList = [s1 s2 s3 s4 s5 s6];
    
    % randomize the order of image stimuli objects
    imageStimList = shuffleArray(imageStimList);

    
    % RUN TRAINING
    % Does this experiment have any training sections?
    
    % RUN TRIALS
    % for each imageFileName, display it, then flash a prompt for the
    % subject to talk, and record what they say...
    for i=1:length(imageStimList)
        % Get the ith stim
        imageStim = imageStimList(i);
        imageFileName = imageStim.fileName;
        imageKey = imageStim.key;
        myLog.add(imageKey);

        % flash to prompt for audio input
        flashStringOnScreen(window, imageStim.key, dt, dt);
        
        myLog.add(num2str(getSecs()-startTime));
        myLog.add(num2str(toc(sT)));
        
        % display it for 'imageDisplayTime' seconds.
        displayImageCenteredUntilSpaceKey (window, imageFileName);
                
        % flash to prompt for audio input
        flashStringOnScreen(window, 'Go!', dt, dt);
        
        % record audio
        recordAudioFromMicrophoneUntilSpaceKey(participantId, [imageKey '.wav'] , recordingLength);

        myLog.add(num2str(getSecs()-startTime));
        myLog.add(num2str(toc(sT)));
        myLog.nextRow();
        
        % check if we are trying to halt the experiment.
        checkForEscapeKeyToHalt();
    end

    % tell them it is almost over
    showInstructions(window, 'That completes the experiment! Thanks for your participation! Now we have a few quick exit questions for you to anwser. Your feedback is important to us.' , 1);
    
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