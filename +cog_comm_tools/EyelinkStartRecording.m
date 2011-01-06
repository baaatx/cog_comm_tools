% Wrapper for sending the START RECORDING command to the Eyelink Host
% computer... (records all data types by default.)
%
%
% Author: Brian Armstrong
%
function EyelinkStartRecording()
     Eyelink('StartRecording',1,1,1,1);