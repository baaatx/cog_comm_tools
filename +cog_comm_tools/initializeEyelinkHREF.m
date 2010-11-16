% Wrapper Function to initialize EyeLink Equipment.
%
% window - the window pointer
%
% resolution - the [maxX maxY] vector returned when initializing the window
%
%
% Author: Brian Armstrong
%
function el = initializeEyelinkHREF(window, resolution)
    % stuff from etb examples I assume we should do
    ListenChar(2);
    commandwindow;
    
    % EyelinkInit is an 'Eyelink oneliner'
    [result, dummy ] = EyelinkInit(0, 1);
    
    % handle error
    if (result ~= 1)
        error ('There was a failure initializing EyeLink');
    end
    
    % set the tracker ro use our screen's resolution
    status = cog_comm_tools.EyelinkSetResolution(resolution.width,resolution.height);
    
    
    % set the data we want to record in the EDF file
    Eyelink('Command', 'file_sample_data = HREF,PUPIL,AREA,BUTTON');
    
    % Sets data in samples sent through link.
    Eyelink('Command', 'link_sample_data = HREF,PUPIL,AREA,BUTTON');
    
    % Sets data in events sent through link. 
    Eyelink('Command', 'link_event_data = AREA,HREF,VELOCITY');
    
    % Sets how velocity information for saccade detection is to be
    % computed.
    Eyelink('Command', 'recording_parse_type = HREF');
    
    % init and return default values
    el = EyelinkInitDefaults(window);