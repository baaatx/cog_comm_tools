% Wrapper to save the eyelink file to a participant's folder
%
% Author: Brian Armstrong
%
function status = EyelinkSaveFile(filename, participantId)
    % send command
    status = Eyelink('ReceiveFile', [] , ['participants/' participantId '/eyelink/' filename]);
    
    % handle error
    if (status <= 0)
        error (['There was an error receiving file ' filename ' for ' participantId ]);
    end    