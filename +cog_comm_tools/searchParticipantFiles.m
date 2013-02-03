% Returns a list of filenames
%
% participantId - a participantId
%
% sessionId - session to check existance
%
% searchPattern - pattern used to search files 
%
% Author: Brian Armstrong
%
function filenames = searchParticipantFiles(participantId, sessionId, searchPattern)
    searchPath = ['participants' filesep participantId filesep sessionId];
    filePattern = searchPattern;
    filenames = cog_comm_tools.recursiveFindFile(searchPath,filePattern);
end
