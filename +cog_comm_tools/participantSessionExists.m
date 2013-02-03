% Check if there is a session folder for a given participantId
%
% participantId - a participantId
%
% sessionId - session to check existance
%
% Author: Brian Armstrong
%
function exists = participantSessionExists(participantId, sessionId)
    exists = false;
    participantSessions = cog_comm_tools.listParticipantSessionFolders(participantId);
    if (cog_comm_tools.cellArrayContains(participantSessions, sessionId))
        exists = true;
    end