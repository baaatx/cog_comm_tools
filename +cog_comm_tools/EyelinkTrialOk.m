% Wrapper for sending the TRIAL OK message to the Eyelink Host Computer.
%
%
% Author: Brian Armstrong
%
function EyelinkTrialOk()
     Eyelink('Message', 'TRIAL OK ');