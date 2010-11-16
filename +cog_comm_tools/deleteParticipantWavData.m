% Deletes all .wav files in the participants audio directory.
%
%
% Author: Brian Armstrong
%
function filesDeleted = deleteParticipantWavData(participantId)

path = ['participants/' participantId '/audio/'];

files = dir ([path '*.wav']);

filesDeleted = 0;

% delete each wav file...
for i=1:length(files)
    delete([path files(i).name ]);
    filesDeleted = filesDeleted + 1;
end