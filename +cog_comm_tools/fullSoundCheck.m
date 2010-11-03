% fullSoundCheck checks to make sure participant's voice is activating audio
% recording at desired threshold.
%
% The soundCheck is recorded in a WAV file, and an image of the WAV is
% presented so the experimenter can make sure audio recording is working
% properly.
%
% window - pointer to a valid window
%
% participantId - the participant's unique id

function fullSoundCheck(window , participantId)

soundCheckInstructions = 'We''ll begin with a sound check.\n\nRead the sentence presented while speaking into the microphone.\n\nWhenever you''re ready the experimenter will press a\nbutton to begin the sound check.';
cog_comm_tools.displayInstructions(window, soundCheckInstructions);

% define varibles
readingDelay = 0.8;
recordingLength = 5;
soundCheckSentence = 'Say "The red fox ran into the woods."';
recordingMessage = '(Recording)';
doneRecordingMessage = '(Finished Recording)';

lowerBound = 0.25;
upperBound = 0.71;

% until we break out with space key, we keep running the sound check.
while (true)
    cog_comm_tools.checkForEscapeKeyToHalt();

    % present the sentence
    DrawFormattedText(window, [' \n\n\n' soundCheckSentence], 'center', 'center', 0);
    Screen('Flip',window);
    
    % let them read the sentence before recording
    WaitSecs(readingDelay);
    
    % record audio
    DrawFormattedText(window, [recordingMessage '\n\n\n' soundCheckSentence], 'center', 'center', 0);
    Screen('Flip',window);
    
    cog_comm_tools.recordAudioFromMicrophone(participantId, recordingLength, 'soundCheck');

    DrawFormattedText(window, [doneRecordingMessage '\n\n\n' soundCheckSentence], 'center', 'center', 0);
    Screen('Flip',window);
    
    % draw the image of the wave sound
    cog_comm_tools.saveSoundCheckImage(participantId, lowerBound, upperBound);
   
    % play the wav and store the fileTime
    fileTime = cog_comm_tools.playWav(['participants/' participantId '/audio/soundCheck.wav']);

    % allow for an escape key halt at this point
    cog_comm_tools.checkForEscapeKeyToHalt();
    
    % show the image of the sound
    cog_comm_tools.DisplayImageCenteredAndWait(window, ['participants/' participantId '/images/soundCheckImage.jpg'], 0.1);
    
    % wait until the experimenter presses a key to continue
    KbWait();
    
    % Let the RA accept the sound check.
    cog_comm_tools.displayInstructions(window, 'Experimenter: Does the sound check look okay? If so, hold the SPACEBAR to continue to the experiment. Press any other key to run the soundcheck again.', 1.0);
            
    % check for spaceKey Hold down
    if (cog_comm_tools.checkForKeyPress('space'))
        break;
    end
    
    cog_comm_tools.displayInstructions(window, 'Let''s try the sound check again.', 0.2);
end

% signal that the soundcheck has completed.
cog_comm_tools.flashStringOnScreen(window, 'Sound Check Complete!', 1.0, 0.1);