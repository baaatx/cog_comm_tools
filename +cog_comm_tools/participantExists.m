% Check if there is a participant folder for this participantId
%
% participantId - a participantId
%
%
% Author: Brian Armstrong
%
function exists = participantExists(participantId)
    exists = false;
    participants =  cog_comm_tools.listParticipantFolders();
    if (cog_comm_tools.cellArrayContains(participants, participantId))
        exists = true;
    end