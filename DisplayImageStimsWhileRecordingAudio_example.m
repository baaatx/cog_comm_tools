% DisplayImageStimsWhileRecordingAudio_example.m.m - 
%  Displays some imageStims in a list using functions in cog_comm_tools
%  while recording audio from the microphone.
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
screenResolution = [1152 864];

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
   
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);

    participantId = 'exampleParticipantId';
    sessionId = 'exampleSessionId';
    fileName = 'exampleAudioWithStimsPresented';
    audioBufferLength = 30;

    % here we create 3 imageStim objects, which encapsulate the data needed
    % to present stimuli images.
    %
    % Constructor Call:
    %
    % function obj = ImageStim(keyCode, fileName, xPos, yPos, title)
    %
    s1 = ImageStim('x0', 'stimuli/images/redBall.jpg', 180,180, 'Red Ball');
    s2 = ImageStim('x1', 'stimuli/images/babyChicken.jpg', 700,300, 'Baby Duck');
    s3 = ImageStim('x2', 'stimuli/images/redFinch.jpg', 250,650, 'Red Finch');
    
    displayInstructions(window, 'You will see some images appear on the screen...\n Say what you see as you see it.');

    [portAudioHandle] = startRecordingAudioFromMicrophone(audioBufferLength);

    clearWindow(window);
    
    ListenChar();
    
    % draw and display some images
    displayImageStimWithTitle(window, s1);
    WaitSecs(1);
    
    displayImageStimWithTitle(window, s2);
    WaitSecs(1);
    
    displayImageStimWithTitle(window, s3);
    WaitSecs(1);
    
    displayImageStimWithTitle(window, s2);
    WaitSecs(1);
    
    displayImageStimWithTitle(window, s3);
    WaitSecs(1);
    
    displayImageStimWithTitle(window, s2);
    WaitSecs(1);
    
    displayImageStimWithTitle(window, s1);
    WaitSecs(1);
    clearWindow(window);
    
    stopRecordingAudioFromMicrophone(portAudioHandle, participantId, sessionId, fileName);
    
    displayInstructions(window, 'Recording example completed... Now the audio will be played back...');
    
    recordedFileFullPath = ['participants/' participantId filesep sessionId filesep 'audio' filesep fileName '.wav'];

    % play the recorded audio back
    audioRecorded = AudioStim('recordedAudioExample', recordedFileFullPath , 'The recorded audio for this example');
    
    audioRecorded.open();
    audioRecorded.play();
    
    displayInstructions(window, 'Playing Audio - Example completed...');
    
    audioRecorded.stop();
    audioRecorded.close();
    
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