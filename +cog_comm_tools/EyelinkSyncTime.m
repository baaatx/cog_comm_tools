% Wrapper for setting zero time point in current EDF file that is being
% recorded...
%
% NOTE: You should call this at the start of every trial to set the zero
% time point when using the Eyelink equipment.
%
%
% Author: Brian Armstrong
%
function EyelinkSyncTime()
     Eyelink('Message', 'SYNCTIME');