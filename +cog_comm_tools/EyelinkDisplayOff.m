% Wrapper for sending the DISPLAY ON message to the Eyelink host machine.
%
%
% Author: Brian Armstrong
%
function EyelinkDisplayOff()
     Eyelink('Message', 'DISPLAY OFF');