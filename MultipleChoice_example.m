% MultipleChoice_example.m - shows how multiple choice works
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

% a try block 'tries' a block of code and if an execption occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    % define the choice options - Choice(keyCode, value)
    %
    %    NOTE: keyCode is which key they press to choose that option
    %          and it must represent a valid key on the keyboard.
    %          Normally just use the lowercase version of letters.
    %          (Whatever results from just pressing that key.)
    %          or 'ESCAPE', 'SPACE', etc.  If the key is invalid
    %          you'll get an error message.
    %
    A = Choice('a', 'Apple');
    B = Choice('p', 'Pear');
    C = Choice('k', 'Kiwi');
    D = Choice('d', 'Durian');
    
    % the choice list is an ordered list which contains all the possible choices in a multiple
    % choice dialog will present as options.
    choiceList = [A B C D];

    % start the multiple Choice Dialog
    [answer, responseTime]  = multipleChoiceDialog(window, 'Which fruit do you like the most?' , choiceList);
    
    % tell them what they selected
    displayInstructions(window, ['You selected ' answer ' after ' num2str(responseTime) ' seconds.']);
    
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