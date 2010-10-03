% Check if there is a participant folder for this participantId
%
% Author: Brian Armstrong
%
function participantExists = participantExists(participantId)
    participantExists = false;
    participants =  cog_comm_tools.listParticipantFolders();
    if (cog_comm_tools.cellArrayContains(participants, participantId))
        participantExists = true;
    end