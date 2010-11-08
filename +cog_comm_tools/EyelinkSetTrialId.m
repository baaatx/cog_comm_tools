% Wrapper for setting the Eyelink Trial ID.
%
% trialId - ID for current trial (string)
%
% NOTE: You should call this at the start of every trial in experiments
% using the Eyelink equipment.
%
%
% Author: Brian Armstrong
%
function EyelinkSetTrialId(trialId)
     Eyelink('Message', ['TRIALID ' trialId]);