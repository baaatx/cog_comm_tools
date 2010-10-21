% Wrapper to initialize EyeLink Equipment
%
% Author: Brian Armstrong
%
function initializeEyelink(resolution)
    % call initialize
    %status = Eyelink('Initialize');
    % EyelinkInit is an 'Eyelink oneliner'
    [result, dummy ] = EyelinkInit(0, 1);
    
    % handle error
    if (result ~= 1)
        error ('There was a failure initializing EyeLink');
    end
    
    % set the tracker ro use our screen's resolution
    status = cog_comm_tools.EyelinkSetResolution(resolution.width,resolution.height);
    
    % make sure that we get gaze data from the Eyelink (from ETB)
    Eyelink('Command', 'link_sample_data = LEFT,RIGHT,GAZE,AREA');   