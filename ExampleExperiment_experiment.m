% ExampleExperiment_experiment.m - an example experiment using cog_comm_tools
% which displays some images and records audio.
%
%
% Author: Brian Armstrong
%
% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

% define the screen resolution the experiment is going to run on. [x y]
screenResolution = [1024 768];

% DEFINE EXPERIMENT CONSTANTS

% amount of time images are displayed.
imageDisplayTime = 2.0;

% time for a short pause
dt = 0.2;

% how long to record for
audioRecordingLength = 2.00; 

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style... save the window pointer and the resolution structure
    [window, resolution ] = initializeWindow(fontFace, fontSize, fontStyle, screenResolution );
    
    % store start time for start of experiment
    startTime = GetSecs();
    
    % initilze the participant
    [participantId, sessionId] = initializeParticipant(window);
    %participantId = 'exampleParticipantId';
    
    % run the full sound check since we are recording audio from the
    % participant with a microphone
    fullSoundCheck(window, participantId, sessionId);
    
    % Setup our trials log.  
    myLog = TDFLog(['participants' filesep participantId filesep sessionId filesep 'exampleTrialsLog.txt']);
    myLog.add('ImgCode');
    myLog.add('StrTime');
    myLog.add('StpTime');
    myLog.add('RspTime');
    myLog.nextRow();
        
    % DISPLAY INSTRUCTIONS
    displayInstructions(window, 'You will see a series of images displayed on the screen.\n\nWhen you see ''Speak Now!'' flash on the screen, say the first word that comes to your mind.\n\nWhen you are finished speaking, press the space bar on the keyboard. This will continue until the experiment has completed.\n\n Do you have any questions?  ' , 1);

    % we will initialize our stims to the screen midpoints
    %(we will display them centered on the screen.)
    
    midX = round(resolution.width / 2);
    midY = round(resolution.height / 2);
    
    % DEFINE STIMULI
    %
    % Here, we create image stimuli objects (encapsulates data for image
    % stimuli)...
    %
        
    s1 = ImageStim('x0', 'stimuli/images/redBall.jpg', midX, midY , 'ball');
    s2 = ImageStim('x1', 'stimuli/images/blueTriangle.jpg', midX, midY , 'triangle');
    s3 = ImageStim('x2', 'stimuli/images/pinkSquare.jpg', midX, midY, 'square');
    s4 = ImageStim('x3', 'stimuli/images/orangeHexagon.jpg', midX, midY, 'hexagon');
    s5 = ImageStim('x4', 'stimuli/images/silverInfinity.jpg', midX, midY, 'infinity');
    s6 = ImageStim('x6', 'stimuli/images/blackSix.jpg', midX, midY, 'six');
    s7 = ImageStim('x7', 'stimuli/images/redCross.jpg', midX, midY, 'cross');
    
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
                
        % display it for 'imageDisplayTime' seconds.
        displayImageStim (window, imageStim);
        
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
        responseTime = recordAudioFromMicrophoneUntilSpaceKey(participantId, sessionId, audioRecordingLength, imageKeyCode);

        % prompt the participant to stop speaking
        displayTextCentered(window, 'Stop Speaking!');
        
        WaitSecs(dt);
                
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
    displayInstructions(window, 'That completes the experiment! Thanks for your participation! Now we have a few quick exit questions for you to anwser. Your feedback is important to us.');
    
    % DEBRIEFING
    questionFile = 'SeeImageQuestions';
    questionText1 = 'Did You Enjoy Participating in This Experiment?';
    askQuestionAndSaveAnswer(window, questionFile, 'q1', questionText1, participantId, sessionId );

    questionText2 = 'Did you have to think much before speaking the first thing that came to your mind?';
    askQuestionAndSaveAnswer(window, questionFile, 'q2', questionText2, participantId, sessionId );
    
    % say goodbye
    displayInstructions(window, 'That is all! Thanks for your participation! ');
    
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