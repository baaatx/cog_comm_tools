% Wrapper for setting an Area of Interest Rectangle in the EDF file (while
% recording)
%
% Author: Brian Armstrong
%
function EyelinkSetIARectangle(IAID, IAlabel, x1, y1, x2, y2)
     Eyelink('Message', ['!V IAREA RECTANGLE ' num2str(IAID) ' ' num2str(x1) ' ' num2str(y1) ' ' num2str(x2) ' ' num2str(y2) ' ' IAlabel]);  