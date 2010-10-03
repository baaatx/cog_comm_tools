% Ask the subject a question and saves/appends the question and answer to questionFile in the
% subjects/subjectid/debriefing directory.

function askQuestionAndSaveAnswer(window, questionFile, questionText, participantId)
    % get the answer
    answer = cog_comm_tools.GetEchoStringCentered(window, ['\n\n' questionText '\n\n' 'Please Type Your Answer, ending with ENTER:\n\n'] , 'center', 'center');

    % write it to file
    outputFile = cog_comm_tools.openFileForAppend(['participants/' participantId '/debriefing/' questionFile '.txt']);
    fprintf(outputFile, ['\n\nQ:' questionText '\nA:' answer]);
    fclose(outputFile);