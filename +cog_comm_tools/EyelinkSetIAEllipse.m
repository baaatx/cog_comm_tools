% Wrapper for setting an Area of Interest ELLIPSE in the EDF file (while
% recording).
%
% IAID - the interest area ID (integer)
%
% IAlabel - the interest area label (string)
%
% X1,Y1 - first coordinate for ellipse (integers)
%
% X2,Y2 - second coordinate for ellipse (integers)
%
%
% Author: Brian Armstrong
%
function EyelinkSetIAEllipse(IAID, IAlabel, X1, Y1, X2, Y2)
     Eyelink('Message', ['!V IAREA ELLIPSE ' num2str(IAID) ' ' num2str(X1) ' ' num2str(Y1) ' ' num2str(X2) ' ' num2str(Y2) ' ' IAlabel]);  