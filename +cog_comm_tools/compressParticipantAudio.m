% Runs the external MP3 (LAME) encoder on all audio files in the participant's
% folder. 
%
% NOTE: This may take a substantial amount of time to complete if there is
% a large number of files to compress.
%
%
% Author: Brian Armstrong
%
function filesCompressed = compressParticipantAudio(participantId)

files = dir (['participants/' participantId '/audio/*.wav']);
path = pwd();

filesCompressed = 0;

% do windows version
if (IsWindows())
    
    % this is the lame mp3 program on our windows machines
    command = 'c:\Progra~1\lame\lame ' ;
    
    % run the compression command on each wav file...
    for i=1:length(files)
        system( [command ' ' pwd '\participants\' participantId '\audio\' files(i).name ] );
    end
end

% do MAC version
if (ismac())
    
    % this is the lame mp3 program on our mac machines
    command = '/Applications/lame-3.98.4/frontend/lame';
   
    % run the compression command on each wav file
    for i=1:length(files)
        system( [command ' ' pwd '/participants/' participantId '/audio/' files(i).name ] );
    end
end