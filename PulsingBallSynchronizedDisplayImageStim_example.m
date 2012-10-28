% PulsingBallSynchronizedDisplayImageStim_example.m - 
%
%
% Displays four balls pulsing with audio queue as an example
% of how to use audio and visual stimuli to create a model
% for the participant to follow.
%
% Trying to get the particpant to say four words at certains times based
% on the audio visual queue.
% 
%
% Author: Brian Armstrong
%

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;

% import customized functions for this experiment
import custom.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

participantId = 'exampleParticipantId';

% here we are specifying what screen resolution we want
screenResolution = [1152 864];

% a try block 'tries' a block of code and if an exception occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    ListenChar(); 
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    % here we create 3 imageStim objects, which encapsulate the data needed
    % to present stimuli images.
    %
    % Constructor Call:
    %
    % function obj = ImageStim(keyCode, fileName, xPos, yPos, title)
    %

    midX = round(resolution.width / 2);
    midY = round(resolution.height / 2);

    % these stims are used to display the synched blinking guide
    % during playback and during recording.
    ballA = ImageStim('x0', 'stimuli/images/blue_circle.jpg', 250, midY, 'Sphere Wireframe A');
    ballA.changeSize(-500);
    maskA = ImageStim('x3', 'stimuli/images/red_circle.png', 250, midY, 'Sphere Wireframe D');
    maskA.changeSize(-50);
    ballA.maskingImageStim = maskA;
    
    ballB = ImageStim('x1', 'stimuli/images/blue_circle.jpg', 550, midY, 'Sphere Wireframe B');
    ballB.changeSize(-500);
    maskB = ImageStim('x3', 'stimuli/images/red_circle.png', 550, midY, 'Sphere Wireframe D');
    maskB.changeSize(-50);
    ballB.maskingImageStim = maskB;
    
    ballC = ImageStim('x2', 'stimuli/images/blue_circle.jpg', 850, midY, 'Sphere Wireframe C');
    ballC.changeSize(-500);
    maskC = ImageStim('x3', 'stimuli/images/red_circle.png', 850, midY, 'Sphere Wireframe D');
    maskC.changeSize(-50);
    ballC.maskingImageStim = maskC;
    
    ballD = ImageStim('x3', 'stimuli/images/blue_circle.jpg', 1150, midY, 'Sphere Wireframe D');
    ballD.changeSize(-500);
    maskD = ImageStim('x3', 'stimuli/images/red_circle.png', 1150, midY, 'Sphere Wireframe D');
    maskD.changeSize(-50);
    ballD.maskingImageStim = maskD;
    
    % Our short beep to use as a metronome-like guide
    shortBeepAudio = AudioStim('shortBeep', 'stimuli/audio/short_beep.wav', 'Short Beep');
    
    %define audio overlay stimuli
    overlayAudio = AudioStim('fiveFriends', 'stimuli/audio/five_friends_fry_fish_140BPM.wav', 'Short Beep');

    % put the image stims into a single list for use by our method
    syncImageStims = [ballA ballB ballC ballD];

    %set the beats per minute we want to sync to
    beatsPerMinute = 140;
    
    secondsPerBeat = 60 / beatsPerMinute;
    
    %seconds to display one pulse
    secondsToDisplay = secondsPerBeat / 2;
    
    %how much we change the size of the image when pulsing
    sizeChange = 50;
    
    %pulse once (grow and shrink)
    numPhases = 1;
    numSteps = 2;
    
    dt = secondsToDisplay / numSteps;
    
    % this is the error correction factor we subtact as program latency
    % so that we don't spend too much time waiting
    waitErrorCorrection = 0.0139;
    
    %change in size per step for the image when pulsing
    dSize = sizeChange / numSteps;

    numSyncImageStims = size(syncImageStims, 2);
    audioBufferLength = 10;

    % just for information and error value checking
    cumulativeWaitingTime = 0;
    cumulativeDrawingTime = 0;
    totalExpectedTime = numSteps * secondsToDisplay * numSyncImageStims;

    displayInstructions(window, 'A audio synched visual queue will be presented as a model to follow in later trials.');
    
    % begin loop
    [portAudioHandleOverlay, startTime] = playAudioStimAndContinue(overlayAudio);

    loopStartTime = GetSecs();
    imageIndex = 1;
    
    % this loop pulses each image in the list
    while (imageIndex <= numSyncImageStims)
        imageToPulse = syncImageStims(imageIndex);
        %starting from images begining size
        phase=0;
        while (phase <= numPhases)
            step = 0;
            while (step < numSteps)
                startTime = GetSecs();
                
                imageToPulse.changeSize(dSize);

                %elapsedTime = GetSecs() - loopStartTime;
                %drawTextAtPosition(window, ['elapsedTime:' num2str(elapsedTime)], 20,20);
                
                drawImageStims(window, syncImageStims);

                % on the first 'beat' we display the masking image and play
                % a beep to denote the 'beat'
                if (step == 0 && phase == 0)
                    drawImageStim(window, imageToPulse.maskingImageStim);
                    [portAudioHandle, startTime] = playAudioStimAndContinue(shortBeepAudio);
                end


                displayWindow(window);

                stopAudioStimPlayback(portAudioHandle);

                portAudioHandle = [];

                step = step + 1;
                
                timeToDraw = GetSecs() - startTime;

                cumulativeDrawingTime = cumulativeDrawingTime + timeToDraw;
                
                timeToWait = dt - timeToDraw - waitErrorCorrection;
                
                cumulativeWaitingTime = cumulativeWaitingTime + timeToWait;

                if (timeToWait < 0)
                   error('dt is to small, can''t draw that fast - decrease numSteps or slow down'); 
                end

                %disp (['step:' num2str(step) ' time to draw:' num2str(timeToDraw)]);

                WaitSecs(timeToWait);


            end
            %change direction of pulse
            dSize = dSize * -1;
            
            %move onto next change in direction
            phase = phase + 1;
        end
        %move onto next image
        imageIndex = imageIndex + 1;
    end
   
    % stop the audio playback that we started previously
    stopAudioStimPlayback(portAudioHandleOverlay);
   
    % show some data pertaining to this iteraction of the trial
    loopEndTime = GetSecs() - loopStartTime;
    
    displayTextCentered(window, ['loopEndTime: ' num2str(loopEndTime)]);
    KbWait();
    WaitSecs(0.2);
    
    displayTextCentered(window, ['total wait time: ' num2str(cumulativeWaitingTime)]);
    KbWait();
    WaitSecs(0.2);
    
    displayTextCentered(window, ['total draw/play time: ' num2str(cumulativeDrawingTime)]);
    KbWait();
    WaitSecs(0.2);
        
    % this shows how the recording realtime data varies - we do our best to
    % collect the data as accurately as possible
    displayTextCentered(window, ['missing time: ' num2str(loopEndTime - totalExpectedTime)]);
    KbWait();
    WaitSecs(0.2);    
    
    
    % SHUTDOWN THE EXPERIMENT
    shutDownExperiment();
    
catch
    ListenChar(); 
    % This "catch" section executes in case of an error in the "try" section above.
    % If we encounter an exception, we clean up.

    % Clean up.
    shutDownExperiment();
    
    % Since we are catching (handling) the error, we want to rethrow it so we can see
    % what happened. We only catch it to call shutDownExperiment.
    psychrethrow(psychlasterror);
end