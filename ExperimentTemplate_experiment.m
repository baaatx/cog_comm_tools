% This is a template to help you write your own experiment.
% 
% Author: Brian Armstrong

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% DEFINE EXPERIMENT CONSTANTS

% amount of time images are displayed.
imageDisplayTime = 2.0;

% time for a short pause in seconds
dt = 0.2;

% how long to record for in seconds
recordingLength = 2.00; 

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

% define the screen resolution the experiment is going to run on. [x y]
screenResolution = [1152 864];

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
    
    % run the full sound check if we are recording audio from the
    % participant with a microphone
    fullSoundCheck(window, participantId);
    
    % Setup our log.  
    myLog = TDFLog(['participants/' participantId '/LogName.txt']);
    %myLog.add('Col_1_Title');
    %myLog.add('Col_2_Title');
    %myLog.nextRow();
        
    % DISPLAY INSTRUCTIONS
    displayInstructions(window, 'Here are some instructions ' , 1);

    % DEFINE STIMULI
    % create image stimuli objects (encapsulates data for still image stimuli)
    s1 = ImageStim('x0', 'stimuli/images/redBall.jpg', 0, 0, 'red ball');
    s2 = ImageStim('x1', 'stimuli/images/blackSix.jpg', 0, 0, 'black six');    
    
    % the array of image stimuli objects
    imageStimList = [s1 s2];
    
    % randomize the order of image stimuli objects
    imageStimList = shuffleArray(imageStimList);
    
    % RUN TRAINING
    % Does this experiment have a training section? If so, it probably
    % would go here just before the trials.
    
    % RUN TRIALS
    % for each image stim, display it (using image data), then flash a prompt for the
    % subject to talk, and record what they say.
    for i=1:length(imageStimList)
        % Logic For Trials Goes Here...
        % We aren't doing anything much here, just displaying an image
        
        % display an image
        displayImageDataCenteredAndWait(window, imageStimList(i).imageData, 1);
        
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
    
    % possibly append results (log) to master file here.
    
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