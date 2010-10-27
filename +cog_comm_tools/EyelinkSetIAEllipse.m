% Wrapper for setting an Area of Interest ELLIPSE in the EDF file (while
% recording).
%
% Author: Brian Armstrong
%
function EyelinkSetIAEllipse(IAID, IAlabel, minX, minY, maxX, maxY)
     Eyelink('Message', ['!V IAREA ELLIPSE ' num2str(IAID) ' ' num2str(minX) ' ' num2str(minY) ' ' num2str(maxX) ' ' num2str(maxY) ' ' IAlabel]);  