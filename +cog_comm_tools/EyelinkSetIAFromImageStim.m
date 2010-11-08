% Wrapper for setting an Area of Interest Rectangle in the EDF file (while
% recording) for an imageStim (it uses the destRect information inside the
% imageStim object.
%
% IAID - the unique numeric ID for this interest area (integer)
%
% IAlabel - the textual label for this interest area (string)
%
% imageStim - the imageStim to use for the destRect (an imageStim object)
%
%
% Author: Brian Armstrong
%
function EyelinkSetIAFromImageStim(IAID, IAlabel, imageStim)
     destRect = imageStim.destRect;
     x1 = destRect(1);
     y1 = destRect(2);
     x2 = destRect(3);
     y2 = destRect(4);
     Eyelink('Message', ['!V IAREA RECTANGLE ' num2str(IAID) ' ' num2str(x1) ' ' num2str(y1) ' ' num2str(x2) ' ' num2str(y2) ' ' IAlabel]);  