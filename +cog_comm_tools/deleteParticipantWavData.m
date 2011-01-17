% Function that deletes all .wav files in the participants audio directory.
%
% participantId - the participant's unique id
%
%
% Author: Brian Armstrong
%
function numFilesDeleted = deleteParticipantWavData(participantId)

    path = ['participants/' participantId '/audio/'];

    files = dir ([path '*.wav']);

    numFilesDeleted = 0;

    % delete each wav file...
    for i=1:length(files)
        delete([path files(i).name ]);
        numFilesDeleted = numFilesDeleted + 1;
    end