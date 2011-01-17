% Wrapper for sending the START RECORDING command to the Eyelink Host
% computer... (records all data types by default.)
%
%
% linkEvents - (optional) record in linkEvent mode (enable real time
% events to be sent via ethernet connection)
%
%
% Author: Brian Armstrong
%
function EyelinkStartRecording(linkEvents)

    % the options available when recording...
    enableFileSamples = 1;
    enableFileEvents = 1;
    enableLinkSamples = 0;
    enableLinkEvents = 0;
 
    % real time (link) mode enabled...
    if (nargin == 1 && linkEvents == true)
        enableLinkSamples = 1;
        enableLinkEvents = 1;
    end
    
    Eyelink('StartRecording', enableFileSamples, enableFileEvents, enableLinkSamples, enableLinkEvents);