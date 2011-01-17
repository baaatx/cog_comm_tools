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
        error ('There was a failure initializing EyeLink...');
    end
    
    % set the tracker ro use our screen's resolution
    cog_comm_tools.EyelinkSetResolution(resolution.width,resolution.height);
    
    %{
    – GAZE screen xy (gaze) position
    – GAZERES units-per-degree screen resolution
    – HREF head-referenced eye position data
    – PUPIL raw eye camera pupil coordinates
    – AREA pupil area
    – STATUS warning and error flags
    – BUTTON button state and change flags
    – INPUT input port data lines
    – HTARGET Head target data. Reports target distance and X/Y position for EyeLink Remote eye tracker.
    %}
    
    % Sets data in samples written to EDF file.
    Eyelink('Command', 'file_sample_data = GAZE,GAZERES,HREF,PUPIL,AREA,STATUS,BUTTON,HMARKER');
    
    %{
    – GAZE screen xy (gaze) position
    – GAZERES units-per-degree angular resolution
    – HREF HREF gaze position
    – AREA pupil area or diameter
    – VELOCITY velocity of eye motion (avg, peak)
    – STATUS warning and error flags for event
    – FIXAVG include ONLY average data in ENDFIX events
    – NOSTART start events have no data, just time stamp
    %}
    
    % Sets data in events written to EDF file.
    Eyelink('Command', 'file_event_data = GAZE,GAZERES,HREF,AREA,VELOCITY,STATUS,FIXAVG,NOSTART');
        
    % Sets data in samples sent through link.
    Eyelink('Command', 'link_sample_data = PUPIL,GAZE,GAZERES,AREA,HREF,BUTTON,HMARKER');
    
    % Sets data in events sent through link. 
    Eyelink('Command', 'link_event_data = GAZE,GAZERES,AREA,HREF,VELOCITY,HMARKER');
    
    % init and return default values
    el = EyelinkInitDefaults(window);