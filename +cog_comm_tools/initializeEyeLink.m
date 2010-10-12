% Wrapper to initialize EyeLink Equipment
%
% Author: Brian Armstrong
%
function initializeEyeLink()
    status = Eyelink('Initialize');
    
    if (status == -1)
        error ('There was a failure initializing EyeLink');
    end