% Wrapper for setting an Area of Interest FREEHAND in the EDF file (while
% recording).
%
% IAID - the unique numeric ID for this interest area (integer)
%
% IAlabel - the textual label for this interest area (string)
%
% freehandPoints = even length list of coordinates interpreted as 
% [x1 y1 x2 y2 ... xn yn]
%
% NOTE: Make sure your points list defines an actual polygon.
%
%
% Author: Brian Armstrong
%
function EyelinkSetIAFreehand(IAID, IAlabel, freehandPoints)
    
    % check length of freehandPoints is even
    if (mod(length(freehandPoints),2) ~= 0)
        error('To use EyelinkSetIAFreehand, freehandPoints must contain an even number of coordinates [x1 y1 ... xn yn]');
    end
    
    msg = ['!V IAREA FREEHAND ' num2str(IAID)];
    
    % add coordinate pairs to the message
    i=1;
    while (i<=length(freehandPoints))
        msg = [msg ' ' freehandPoints(i) ',' freehandPoints(i+1)];
        i = i + 2;
    end
    
    msg = [msg ' ' IAlabel];
    
    % send the message
    Eyelink('Message', msg);  