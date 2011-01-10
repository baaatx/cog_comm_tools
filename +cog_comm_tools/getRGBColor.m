% Returns an RGB [red green blue] value for a string representation of
% some basic named colors.
%
% colorString - ('red' 'green' 'blue' 'white' 'black', etc)
%
%
% Author: Brian Armstrong
%

function RGBColor = getRGBColor(colorString)
    
    % convert color string to lower case
    colorString = lower(colorString);

    % return correct 1x3 matrix of RGB values for each supported color
    switch colorString
        case {'white'}
            RGBColor = [255 255 255];
        case {'lightgray', 'lightgrey'}
            RGBColor = [200 200 200];            
        case {'gray', 'grey'}
            RGBColor = [128 128 128];
        case {'khaki'}
            RGBColor = [240 230 140];
        case {'blue'}
            RGBColor = [0 0 255];    
        case {'skyblue'}
            RGBColor = [135 206 235];    
        case {'yellow'}
            RGBColor = [255 255 0];                        
        case {'cobalt'}
            RGBColor = [61 89 171];                        
        case {'green'}
            RGBColor = [0 255 0];                        
        case {'forestgreen'}
            RGBColor = [34 139 34];                        
        case {'red'}
            RGBColor = [255 0 0];            
        case {'purple', 'violet'}
            RGBColor = [255 0 255];                      
        case {'pink'}            
            RGBColor = [255	192	203];
        case {'teal'}            
            RGBColor = [0 128 128];            
        case {'maroon'}            
            RGBColor = [128 0 0];            
        case {'orange'}            
            RGBColor = [255 165 0];            
        case {'black'}
            RGBColor = [0 0 0];            
        otherwise
            error([colorString ' is not a known color, (it could be added to this function if needed... see code for supported colors)']);
    end