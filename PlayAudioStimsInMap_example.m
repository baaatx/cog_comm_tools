% PlayAudioStimsInMap_example.m - Shows a couple different ways to present
% audio stimuli in an experiment...
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

% experimental constants
pauseTime = 3.0;

% a try block 'tries' a block of code and if an expection (error) occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);

    % Create two AudioStim objects - the audio stims...
    %
    % Constructor Call:
    %
    % obj = AudioStim(keyCode, fileName, title)
    %
    audio1 = AudioStim('x0', 'stimuli/audio/gatsby.wav', 'Opening Lines of The Great Gatsby...');
    audio2 = AudioStim('x1', 'stimuli/audio/hitchhikers.wav', 'Opening Lines of Hitchhiker''s Guide...');
    
    % NOTE:
    %
    % A Map is a useful data structure. It allows you to access an arbitrary element
    % by a key.
    %
    % This can be useful in experiments when you want to refer to a stimuli
    % by a key code in your logic.  Follow the example below.
    %
    
    % create a new map object
    audioStimsMap = containers.Map();
    
    % add the audio stimuli to the map by keyCode
    audioStimsMap(audio1.keyCode) = audio1;
    audioStimsMap(audio2.keyCode) = audio2;
            
    % TEST 1
    displayInstructions(window, 'Now, an audio stim will\nplay, pausing the experiment\nuntil it is finished playing...\n');

    % get the audio stim out of the map
    currentStim = audioStimsMap('x0');
    
    % display text before and after playback...
    displayTextCentered(window, ['Playing: ' currentStim.title '(' num2str(currentStim.audioLength) ' secs) ']);
    % play the audio stim until it completes playback
    playAudioStim(currentStim);
    displayInstructions(window, ['Finished Playing: ' currentStim.title]);

    % TEST 2    
    displayInstructions(window, 'Now, an audio stim will\nstart playing, but the experiment\nwill continue, presenting text at\nthe same time...\n');

    % grab another audio stim
    currentStim = audioStimsMap('x1');
    % start audio playback and then continue with the script...
    playAudioStimAndContinue(currentStim);
    
    % Now all these action will occur with the audio playback in the
    % background...
    displayTextCentered(window, ['Started Playing: ' currentStim.title '(' num2str(currentStim.audioLength) ' secs)']);
    WaitSecs(pauseTime);
    displayTextCentered(window, 'But the experiment can continue going...');
    WaitSecs(pauseTime);
    displayTextCentered(window, 'while the audio is played back...');
    WaitSecs(pauseTime);
    displayInstructions(window, 'The second way is useful if you want to\npresent stimuli and record data while audio\nstims are being presented...');
        
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