% Ask the participant a question and saves/appends the question and answer to questionFile in the
% 'participants/participantsId/debriefing' directory.
%
% Author: Brian Armstrong
%
function askQuestionAndSaveAnswer(window, questionFile, questionCode, questionText, participantId)
    % get the answer
    answer = cog_comm_tools.GetEchoStringCentered(window, ['\n\n' questionText '\n\n' 'Please Type Your Answer, ending with ENTER:\n\n'] , 'center', 'center');

    % write it to file, tab delimited
    outputFile = cog_comm_tools.openFileForAppend(['participants/' participantId '/debriefing/' questionFile '.txt']);
    fprintf(outputFile, [participantId '\t' questionCode '\t' questionText '\t' answer '\n']);
    fclose(outputFile);