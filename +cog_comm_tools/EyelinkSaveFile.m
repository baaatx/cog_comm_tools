% Wrapper to save the eyelink file to a participant's folder
%
% fileName - the fileName of the new EDF file to create and save to...
%
% participantId - the current participantId
%
%
% Author: Brian Armstrong
%
function status = EyelinkSaveFile(fileName, participantId, sessionId)
    % send command
    status = Eyelink('ReceiveFile', [] , ['participants/' participantId filesep sessionId '/eyelink/' fileName]);
    
    % handle error
    if (status < 0)
        error (['There was an error receiving file ' fileName ' for ' participantId ]);
    end    