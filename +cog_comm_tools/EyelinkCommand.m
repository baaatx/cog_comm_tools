% Wrapper to send Eyelink equipment a command string.
%
% command - valid Eyelink text command string
%
%
% Author: Brian Armstrong
%
function status = EyelinkCommand(command)
    % send command
    status = Eyelink('Command', command);
    
    % handle error
    if (status ~= 0)
        error (['There was an error sending\n\n' command '\n\nto Eyelink']);
    end    