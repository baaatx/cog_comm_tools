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

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS -
    % save the window pointer and the resolution structure
    [window, resolution ] = initializeWindow(fontFace, fontSize, fontStyle, screenResolution );

    % store start time for start of experiment
    startTime = GetSecs();
    
    % initilze the participant
    participantId = initializeParticipant(window);
    %participantId = 'example';
    error (' '); 
    
    % run the full sound check since we are recording audio from the
    % participant with a microphone
    %fullSoundCheck(window, participantId);
    
    % Setup our trials log.  
    myLog = TDFLog(['participants/' participantId '/exampleTrialsLog.txt']);
    myLog.add('ImgCode');
    myLog.add('StrTime');
    myLog.add('StpTime');
    myLog.add('RspTime');
    myLog.nextRow();
        
    % DISPLAY INSTRUCTIONS
    displayInstructions(window, 'You will see a series of images displayed on the screen.\n\nWhen you see ''Speak Now!'' flash on the screen, say the first word that comes to your mind.\n\nWhen you are finished speaking, press the space bar on the keyboard. This will continue until the experiment has completed.\n\n Do you have any questions?  ' , 1);

    % DEFINE STIMULI
    % create image stimuli objects (encapsulates data for image stimuli)
    s1 = ImageStim('x0', 'stimuli/images/redBall.jpg', 0, 0 , 'ball');
    s2 = ImageStim('x1', 'stimuli/images/blueTriangle.jpg', 0, 0 , 'triangle');
    s3 = ImageStim('x2', 'stimuli/images/pinkSquare.jpg', 0, 0, 'square');
    s4 = ImageStim('x3', 'stimuli/images/orangeHexagon.jpg', 0, 0, 'hexagon');
    s5 = ImageStim('x4', 'stimuli/images/silverInfinity.jpg', 0, 0, 'infinity');
    s6 = ImageStim('x6', 'stimuli/images/blackSix.jpg', 0, 0, 'six');
    s7 = ImageStim('x7', 'stimuli/images/redCross.jpg', 0, 0, 'cross');
    
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
        imageKeyCode = imageStim.keyCode;
        
        % logging
        myLog.add(imageKeyCode);

        % flash to prompt for audio input
        flashStringOnScreen(window, imageStim.keyCode, dt, dt);
                
        % display it for 'imageDisplayTime' seconds.
        drawImageStimCentered (window, imageStim);
        
        % update the screen
        drawWindow(window);
        
        % log display start time
        myLog.add(num2str(getSecs()-startTime));

        % short pause
        WaitSecs(imageDisplayTime);
        
        % log display stop time
        myLog.add(num2str(getSecs()-startTime));
        
        % prompt the participant to start speaking
        displayTextCentered(window, 'Speak Now!');
        
        % record audio - the function returns the response time (to reach
        % minimum audio loudness (amplitude)
        responseTime = recordAudioFromMicrophone(participantId, recordingLength, imageKeyCode);

        displayTextCentered(window, 'Stop Speaking!');
        
        % clear the window (make blank and white)
        clearWindow(window);
        
        % log audio response time
        myLog.add(num2str(responseTime));
        
        % moves log to next row of tab delmited strings
        myLog.nextRow();
        
        % check if we are trying to halt the experiment.
        checkForEscapeKeyToHalt();
    end

    % tell them it is almost over
    displayInstructions(window, 'That completes the experiment! Thanks for your participation! Now we have a few quick exit questions for you to anwser. Your feedback is important to us.' , 1);
    
    % DEBRIEFING
    questionFile = 'SeeImageQuestions';
    questionText1 = 'Did You Enjoy Participating in This Experiment?';
    askQuestionAndSaveAnswer(window, questionFile, 'q1', questionText1, participantId );

    questionText2 = 'Did you have to think much before speaking the first thing that came to your mind?';
    askQuestionAndSaveAnswer(window, questionFile, 'q2', questionText2, participantId );
    
    % say goodbye
    displayInstructions(window, 'That is all! Thanks for your participation! ' , 1);
    
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