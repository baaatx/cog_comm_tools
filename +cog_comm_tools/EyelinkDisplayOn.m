% Wrapper for sending the DISPLAY ON message to the Eyelink host machine.
%
%
% Author: Brian Armstrong
%
function EyelinkDisplayOn()
     Eyelink('Message', 'DISPLAY ON');