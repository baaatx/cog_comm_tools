% Function that gets the id for a participant, and makes sure there is not
% already a folder for this participant.
%
% Creates the participants's data folder in the subjects folder, and creates
% required subdirectories.
%
% Author: Brian Armstrong
%
function participantId = initializeParticipant(window)
    
    needId = true;

    experimenterId = cog_comm_tools.GetEchoStringCentered(window, 'Please enter Experimenter EID: ', 'center', 'center');
    
    while (needId)
        participantId = cog_comm_tools.GetEchoStringCentered(window, 'Please enter Participant id: ', 'center', 'center');
        if (cog_comm_tools.participantExists(participantId))
            participantId = cog_comm_tools.GetEchoStringCentered(window,'Participant ID already exists. Please enter another: ','center','center');
        else
            needId = false;
        end
    end
        
    % TODO: do basic logging here...
    myLog = TDFLog(['participants/' participantId '/ExpLog.txt']);
    myLog.add(participantId);
    myLog.add(experimenterId);
    myLog.add(datestr(now, 'mm/dd/yy'));
    myLog.nextRow();
    
    % change the current folder to the subjects folder
    startDir = cd ('participants');
    
    % make a new folder for this subject (in the subjects folder)
    mkdir(participantId);
        
    cd (participantId);
    
    % make a subdirectories for collected data
    mkdir ('audio');
    mkdir ('images');
    mkdir ('text');
    mkdir ('eyeTracker');
    mkdir ('stimuli');
    mkdir ('debriefing');
    
    % change the directory to where we started at
    cd (startDir);