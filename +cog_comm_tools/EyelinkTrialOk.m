% Wrapper for sending the TRIAL OK message to the Eyelink Host Computer.
% 
% Note: Do this at the end of every trial, before you stop recording...
%
% Author: Brian Armstrong
%
function EyelinkTrialOk()
     Eyelink('Message', 'TRIAL OK ');