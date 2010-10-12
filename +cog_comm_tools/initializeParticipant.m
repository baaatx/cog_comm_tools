% Function that gets the id for a participant, and makes sure there is not
% already a folder for this participant.
%
% Creates the participants's data folder in the subjects folder, and creates
% required subdirectories.
%
% Author: Brian Armstrong
%
function participantId = initializeParticipant(window)
    
    % get RA info
    experimenterId = cog_comm_tools.GetEchoStringCentered(window, 'Please enter Experimenter EID: ', 'center', 'center');

    participantId = cog_comm_tools.GetEchoStringCentered(window, 'Please enter Participant id: ', 'center', 'center');
    
    while (cog_comm_tools.participantExists(participantId))
        if(~cog_comm_tools.yesNoDialog(window, 'Participant ID already exists, are you sure\n\nyou want to overwrite their data?'))
            participantId = cog_comm_tools.GetEchoStringCentered(window,'Participant ID already exists. Please enter another: ','center','center');
        else
            break;
        end
    end
    
    % change the current folder to the subjects folder
    startDir = cd ('participants');
    
    % make a new folder for this subject (in the subjects folder)
    mkdir(participantId);
    
    % now we need to create the appropriate sub-directories
    cd (participantId);
    
    % make a subdirectories for collected data
    mkdir ('audio');
    mkdir ('eyeTracker');
    mkdir ('debriefing');
    
    % change the directory to where we started at
    cd (startDir);
    
    % basic logging goes here.
    myLog = cog_comm_tools.TDFLog([ 'participants/' participantId '/ExpLog.txt']);
    myLog.add('partId');
    myLog.add('experId');
    myLog.add('timestmp');
    myLog.nextRow();
    myLog.add(participantId);
    myLog.add(experimenterId);
    myLog.add(datestr(now, 'mmmm dd, yyyy HH:MM:SS.FFF AM'));
    myLog.nextRow();