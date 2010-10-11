% soundCheck checks to make sure subject's voice is activating audio
% recording at desired threshold
%
% window - pointer to a valid window
%
% Author: Dylan Bumford, Brian Armstrong
%
function soundKeyCheck( window )

soundCheckInstructions = 'We''ll begin with a sound check.\n\nWhen you see a number appear on the screen, please say the number out loud into the microphone.\n\nWhenever you''re ready the experimenter will press a button to begin.';

cog_comm_tools.showInstructions(window, soundCheckInstructions, 1);

voicetrigger = .01;
freq = 44100;

level = 0;

for i=1:5
    cog_comm_tools.displayTextCenteredAndWait(window, '', .4);
    cog_comm_tools.displayTextCenteredAndWait(window, '*', 1);
    cog_comm_tools.displayTextCenteredAndWait(window, '', .4);
    DrawFormattedText(window, num2str(floor(9*rand+1)), 'center', 'center', 0);
    Screen('Flip',window);
    cog_comm_tools.checkForEscapeKeyToHalt();
    while (level < voicetrigger)
        pahandle = PsychPortAudio('Open', [], 2, 0, freq, 1);
        % Preallocate an internal audio recording  buffer with a capacity of 10 seconds:
        PsychPortAudio('GetAudioData', pahandle, 10);
        % Start audio capture immediately and wait for the capture to start.
        % We set the number of 'repetitions' to zero,
        % i.e. record until recording is manually stopped.
        PsychPortAudio('Start', pahandle, 0, 0, 1);
        % Fetch current audiodata:
        audiodata = PsychPortAudio('GetAudioData', pahandle);
        % Compute maximum signal amplitude in this chunk of data:
        if ~isempty(audiodata)
            level = max(abs(audiodata(1,:)));
        else
            level = 0;
        end
        % Below trigger threshold?
        if level < voicetrigger
            % Wait for a millisecond before next scan:
            WaitSecs(0.0001);
        end
    end
    level = 0;
end