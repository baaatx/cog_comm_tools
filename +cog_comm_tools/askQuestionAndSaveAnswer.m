% Ask the participant a question and saves/appends the question and answer to questionFile in the
% 'participants/participantsId/debriefing' directory.
%
% NOTE: You may just want to use getStringInputWithQuestion() if you just
% want to get a string answer to a question from the participant.
%
%
% window - the window pointer
%
% questionFile - the file to save to
%
% questionCode - the key code for the question
%
% questionText - the text of the question
%
% participantId - the unique participantId for the current participant
%
%
% Author: Brian Armstrong
%
function askQuestionAndSaveAnswer(window, questionFile, questionCode, questionText, participantId)
    % get the answer
    answer = '';
    
    % while the string is empty, try to get a string...
    while(strcmp(answer, ''))
        answer = cog_comm_tools.getStringInputWithQuestion(window, ['\n\n' questionText '\n\n' 'Please Type Your Answer, ending with ENTER:\n\n']);
    end

    % write it to file, tab delimited
    outputFile = cog_comm_tools.openFileForAppend(['participants/' participantId '/debriefing/' questionFile '.txt']);
    fprintf(outputFile, [participantId '\t' questionCode '\t' questionText '\t' answer '\n']);
    fclose(outputFile);