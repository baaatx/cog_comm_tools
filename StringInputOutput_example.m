% StringInputOutput_example.m - An example script showing how to prompt a
% participant to enter textual data, and then access it later.
%
% Author: Brian Armstrong
%

% import our lab's custom package so we can use its functions.
import cog_comm_tools.*;
import custom_tools.*;

% font settings
fontFace = 'Arial';
fontSize = 30;
fontStyle = 1;

% here we are specifying what screen resolution we want
screenResolution = [1152 864];

% declare experimental constants
dt = 1.2;

% a try block 'tries' a block of code and if an expection occurs it will jump to the following catch block 
try
    % SETUP EXPERIMENT
    % assert that what we need is installed and working
    initializeExperiment();
    
    % use the example participantId
    participantId = 'exampleParticipantId';
    
    % our input file name
    dataFileName = 'participants/exampleParticipantId/inputLines.txt';
    
    % create a line-delimited-log in overwrite mode (optional 'true' means overwrite)
    myLog = LDFLog(dataFileName, true);
        
    % initilize the window, set font style, unify keyboard for various OS
    [window, resolution] = initializeWindow( fontFace, fontSize, fontStyle, screenResolution);
    
    %
    % Now we prompt participant for some information, logging the answers to a
    % file with a logger object...
    %
    myLog.add( getStringInputWithQuestion(window, 'Please type a kind of fruit...') ) ;
    myLog.add( getStringInputWithQuestion(window, 'Please type a kind of tree...') ) ;
    myLog.add( getStringInputWithQuestion(window, 'Please type of kind of plant...') ) ;
    
    %
    % Now we get the data back out of the file into a cell array of strings...
    %
    myCellArrayOfStrings = textFileToStringArray(dataFileName);
    
    %
    % Now we are able to easily access the data that was original entered
    % by the participant...
    %
    displayTextCentered(window, ['Fruit: ' myCellArrayOfStrings{1}]);
    WaitSecs(1);
    displayTextCentered(window, ['Tree: ' myCellArrayOfStrings{2}]);
    WaitSecs(1);
    displayTextCentered(window, ['Plant: ' myCellArrayOfStrings{3}]);
    WaitSecs(1);
                
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