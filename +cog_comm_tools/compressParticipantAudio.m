% Runs the external MP3 (LAME) encoder on all audio files in the participant's
% folder. 
%
% NOTE: This may take a substantial amount of time to complete if there is
% a large number of files to compress. Tries to compress audio from all
% sessions
%
% participantId - participantId representing data to compress
%
% sessionId - sessionId to compress
%
% Author: Brian Armstrong
%
function filesCompressed = compressParticipantAudio(participantId, sessionId)

sessionFolders = listParticipantSessionFolders(participantId);

files = [];

for i=1:length(sessionFolders)
    sessionId = sessionFolders(i);
    filesInFolder = dir (['participants' filesep participantId filesep sessionId filesep 'audio' filesep '*.wav']);
    files = [files filesInFolder];
end

filesCompressed = 0;

sessionPath = [filesep 'participants' filesep participantId filesep sessionId filesep 'audio' filesep];

% set command based on OS
% do windows version
if (IsWindows())
    % this is the lame mp3 program on our windows machines
    command = 'c:\Progra~1\lame\lame ' ;
end

% do MAC version
if (ismac())
    % this is the lame mp3 program on our mac machines
    command = '/Applications/lame-3.98.4/frontend/lame';
end   

% run the compression command on each wav file...
    for i=1:length(files)
        system( [command ' ' pwd sessionPath files(i).name ] );
    end
end