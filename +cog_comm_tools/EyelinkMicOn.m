% Wrapper for sending the MICROPHONE ON message to the Eyelink host machine.
%
%
% Author: Brian Armstrong
%
function EyelinkMicOn()
     Eyelink('Message', 'MICROPHONE ON');