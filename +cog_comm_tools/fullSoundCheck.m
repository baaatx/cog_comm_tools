% fullSoundCheck checks to make sure participant's voice is activating audio
% recording at desired threshold. The soundCheck is recorded in a WAV 
% file, and an image of the WAV is presented so the experimenter can make
% sure audio recording is working properly.
%
% window - pointer to a valid window
%
% participantId - the participant's unique id
%
%
% Author: Brian Armstrong
%
%
function fullSoundCheck(window , participantId, sessionId)
    % define varibles
    readingDelay = 0.4;
    recordingLength = 5;
    soundCheckSentence = 'Say "The red fox ran into the woods."';
    recordingMessage = '(Recording)';
    doneRecordingMessage = '(Finished Recording)';

    % upper and lower audio level bounds
    lowerBound = 0.25;
    upperBound = 0.71;

    % set the background color to the opposite color of the text...
    currentTextColor = cog_comm_tools.getCurrentTextColor(window);
    backgroundColor = cog_comm_tools.getColorComplement(currentTextColor);

    soundCheckInstructions = 'We''ll begin with a sound check.\n\nRead the sentence presented while speaking into the microphone.\n\nPress the spacebar key when you are finished talking.\n\nWhenever you''re ready the experimenter will press a\nbutton to begin the sound check.';
    cog_comm_tools.displayInstructions(window, soundCheckInstructions, readingDelay, 'keyboard', backgroundColor);

    % until we break out with space key, we keep running the sound check.
    while (true)
        % allow for halt
        cog_comm_tools.checkForEscapeKeyToHalt();

        % present the sentence
        cog_comm_tools.fillWindow(window, backgroundColor);
        cog_comm_tools.drawTextAtPosition(window, [' \n\n\n' soundCheckSentence], 'center', 'center');
        cog_comm_tools.displayWindow(window);

        % let them read the sentence before recording
        WaitSecs(readingDelay);

        % record audio
        cog_comm_tools.fillWindow(window, backgroundColor);
        cog_comm_tools.drawTextAtPosition(window, [recordingMessage '\n\n\n' soundCheckSentence], 'center', 'center');
        cog_comm_tools.displayWindow(window);

        % the audio recording call...
        cog_comm_tools.recordAudioFromMicrophoneUntilSpaceKey(participantId, sessionId, recordingLength, 'soundCheck');

        % let them know we stopped recording...
        cog_comm_tools.fillWindow(window, backgroundColor);
        cog_comm_tools.drawTextAtPosition(window, [doneRecordingMessage '\n\n\n' soundCheckSentence], 'center', 'center');
        cog_comm_tools.displayWindow(window);

        % draw the image of the wave sound
        cog_comm_tools.saveSoundCheckImage(participantId, sessionId, lowerBound, upperBound);

        % play the wav and store the fileTime
        fileTime = cog_comm_tools.playWav(['participants' filesep participantId filesep sessionId filesep 'audio' filesep 'soundCheck.wav']);

        % allow for an escape key halt at this point
        cog_comm_tools.checkForEscapeKeyToHalt();

        % show the image of the sound
        cog_comm_tools.fillWindow(window, backgroundColor);
        cog_comm_tools.DisplayImageCenteredAndWait(window, ['participants' filesep participantId filesep sessionId filesep 'images' filesep 'soundCheckImage.jpg'], readingDelay);

        % wait until the experimenter presses a key to continue
        KbWait();

        % Let the RA accept the sound check.
        cog_comm_tools.displayInstructions(window, 'Experimenter: Does the sound check look okay? If so, hold the SPACEBAR to continue to the experiment. Press any other key to run the soundcheck again.', readingDelay, 'keyboard', backgroundColor);

        % check for spaceKey Hold down
        if (cog_comm_tools.checkForKeyPress('space'))
            break;
        end

        cog_comm_tools.displayInstructions(window, 'Let''s try the sound check again.', readingDelay, 'keyboard', backgroundColor);
    end

    % signal that the soundcheck has completed.
    cog_comm_tools.fillWindow(window, backgroundColor);
    cog_comm_tools.displayTextAtPosition(window, 'Sound Check Complete!', 'center','center');
    WaitSecs(readingDelay*2);