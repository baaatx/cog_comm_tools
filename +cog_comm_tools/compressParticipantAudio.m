% Runs the external MP3 encoder on all audio files in the participants
% folder. 
%
% NOTE: This may take a substantial amount of time to complete.
%
%
% Author: Brian Armstrong
%
function filesCompressed = compressParticipantAudio(participantId)

files = dir (['participants/' participantId '/audio/*.wav']);
path = pwd();

filesCompressed = 0;

% do windows version
if (isWindows())
    
    % this is the lame mp3 program on our windows machines
    command = 'c:\Progra~1\lame\lame ' ;
    
    % run the compression command on each wav file...
    for i=1:length(files)
        system( [command ' ' pwd '\participants\' participantId '\audio\' files(i).name ] );
    end
end

% do MAC version
if (isMac())
    
    % this is the lame mp3 program on our mac machines
    command = '/Applications/lame-3.98.4/frontend/lame';
   
    % run the compression command on each wav file
    for i=1:length(files)
        system( [command ' ' pwd '/participants/' participantId '/audio/' files(i).name ] );
    end
end