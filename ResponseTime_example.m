% ResponseTime_example.m - audio response time example
%
% Author: Brian Armstrong
%

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

% here we are specifying what screen resolution we want
screenResolution = [800 600];

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    %participantId = initializeParticipant(window);
    participantId = 'exampleParticipantId'; % use the default example participant
    recordingLength = 3;
    fileName = 'response_time_example_recording';
    voiceTrigger = 0.01;
    
    % present some instructions
    displayInstructions(window, 'When you see ''Speak Now!''\nappear on the screen, speak as quickly\n as possible!\n\n(We will calculate your response time.)', 1);
    
    % clear the screen
    clearWindow(window);
    
    % Wait a short random time
    WaitSecs(rand + randi(2));
    
    % display some text
    displayTextCentered(window, 'Speak Now!');
    
    % record some audio from the mic
    responseTime = recordAudioFromMicrophoneUntilSpaceKey(participantId, recordingLength, fileName, voiceTrigger);
    
    % tell them what happened.
    displayInstructions(window, ['Your Response Time was: ' num2str(responseTime) ' seconds'], 1);
    
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