% Function that gets the id for a participant, and makes sure there is not
% already a folder for this participant.
%
% Creates the participants's data folder in the 'participants' folder, and creates
% required subdirectories.
%
% window - the window pointer
%
%
% Author: Brian Armstrong
%
function participantId = initializeParticipant(window)
    


    % get RA info
    
    experimenterId = '';

    while(strcmp(experimenterId, ''))
        experimenterId = cog_comm_tools.getStringInputWithQuestion(window, 'Please enter a valid Experimenter ID.');    
    end

    % get room ID
    roomId = '';
    while(strcmp(roomId, ''))
        roomId = cog_comm_tools.getStringInputWithQuestion(window, 'Please enter a valid Lab Room ID.');
    end

    % get unique participantId
    participantId = '';
    
    while (strcmp(participantId, '') || cog_comm_tools.participantExists(participantId))
        % get string input
        participantId = cog_comm_tools.getStringInputWithQuestion(window, 'Please enter a valid Participant ID.');
       
        % if they want to overwrite, break out of the loop
        if (cog_comm_tools.participantExists(participantId))
            if(cog_comm_tools.yesNoDialog(window, 'Participant ID already exists, are you sure\n\nyou want to overwrite their data?'))
                break;
            end
        end
    end
    
    % change the current folder to the subjects folder
    startDir = cd ('participants');
    
    % make a new folder for this participant (in the 'participants' folder) 
    % if it does not exist.
    if (isdir(participantId) == 0)
        mkdir(participantId);
        if (~isdir(participantId))
            error(['Participant folder not created... Is ' participantId ' a valid folder name?']);
        end
    end
    
    % now we need to create the appropriate sub-directories
    cd (participantId);
    
    % make subdirectories (if they don't exist) for data that will be collected
    if (isdir('audio') == 0)
        mkdir ('audio')
    end
    
    if (isdir('images') == 0)
        mkdir('images')
    end
    
    if (isdir('debriefing')==0)
        mkdir ('debriefing');
    end
    
    if (isdir('eyelink')==0)
        mkdir ('eyelink');
    end
    
    % change the directory to where we started at
    cd (startDir);
    
    % Create a simple log with time stamp and experimenter id.
    myLog = cog_comm_tools.TDFLog([ 'participants/' participantId '/ExpLog.txt']);
    myLog.add('partId');
    myLog.add('experId');
    myLog.add('roomId');
    myLog.add('timestmp');
    myLog.nextRow();
    myLog.add(participantId);
    myLog.add(experimenterId);
    myLog.add(roomId);
    myLog.add(datestr(now, 'mmmm dd, yyyy HH:MM:SS.FFF AM'));    