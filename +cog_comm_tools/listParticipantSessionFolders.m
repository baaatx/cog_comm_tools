% Checks the participant's folder for a list of all sessions
%
% participantId - participantId for which you want a list of sessions
%
% Author: Brian Armstrong
%
function listOfSessions = listParticipantSessionFolders(participantId)

dirList = dir(['participants' filesep participantId]);

listOfSessions = cell(1, length(dirList)-2);

% start at 3 because of . and ..
for i=3:length(dirList)
    if (dirList(i).isdir)
        listOfSessions{i-2} = dirList(i).name;
    end
end



    
