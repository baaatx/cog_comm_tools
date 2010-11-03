% ViewParticipants.m - Utility Script for viewing all the participant
% folders in this experiment folder.
%
% Author: Brian Armstrong
%
startDir = cd ('..');
import cog_comm_tools.*;
disp(listParticipantFolders());
cd(startDir);

