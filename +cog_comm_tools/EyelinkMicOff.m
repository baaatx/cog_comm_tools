% Wrapper for sending the MICROPHONE OFF message to the Eyelink host machine.
%
%
% Author: Brian Armstrong
%
function EyelinkMicOff()
     Eyelink('Message', 'MICROPHONE OFF');