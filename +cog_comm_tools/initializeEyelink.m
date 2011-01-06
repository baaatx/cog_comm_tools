% Wrapper Function to initialize EyeLink Equipment.
%
% window - the window pointer
%
% resolution - the [maxX maxY] vector returned when initializing the window
%
% enableDummyMode - (optional) set to true to run Eyelink in dummy mode (can run code even tho it is not really there...)
%
%
% Author: Brian Armstrong
%
function el = initializeEyelink(window, resolution, enableDummyMode)
    
    % supress keyboard from MATLAB window(s)
    ListenChar(2);

    % enabling dummy mode is optional...
    if (nargin < 3)
        enableDummyMode = false;
    end

    dummyMode = 0;
    if (enableDummyMode)
        dummyMode = 1;
    end
    
    % we want video/etc. called back to the display pc
    enableCallBacks = 1;
        
    % EyelinkInit is an 'Eyelink oneliner'
    [result, dummy ] = EyelinkInit(dummyMode, enableCallBacks);
    
    % handle error
    if (result ~= 1)
        error ('There was a failure initializing EyeLink');
    end
    
    % set the tracker ro use our screen's resolution
    cog_comm_tools.EyelinkSetResolution(resolution.width,resolution.height);
    
    % set the data we want to record in the EDF file
    Eyelink('Command', 'file_sample_data = PUPIL,GAZE,GAZERES,AREA,HREF,BUTTON,HMARKER');
    
    % Sets data in samples sent through link.
    Eyelink('Command', 'link_sample_data = PUPIL,GAZE,GAZERES,AREA,HREF,BUTTON,HMARKER');
    
    % Sets data in events sent through link. 
    Eyelink('Command', 'link_event_data = GAZE,GAZERES,AREA,HREF,VELOCITY,HMARKER');
    
    % init and return default values
    el = EyelinkInitDefaults(window);