% Checks the participants folder for a list of all participants
%
%
% Author: Brian Armstrong
%
function listOfParticipants = listParticipantFolders()

dirList = dir('participants');

listOfParticipants = cell(1, length(dirList)-2);

for i=3:length(dirList)
    if (dirList(i).isdir)
        listOfParticipants{i-2} = dirList(i).name;
    end
end



    
