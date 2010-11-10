% Function for merging participants' data with same file name together into a single output file.
%
%
% fileName - relative filename to look for in each participant folder.
%
% outputFileName - the name of the file to save with all participants'
% version of fileName concatenated together.
%
%
% Author: Brian Armstrong
%
function bytesWritten = mergeParticipantFiles(fileName, outputFileName)

% the output file handle
outFile = cog_comm_tools.openFileForOverwrite(outputFileName);

% gets a list of all participants in the current experiment folder
listOfParticipants = cog_comm_tools.listParticipantFolders();

% the counter for the number of bytes we write out to the output file.
bytesWritten = 0;

% for each participant, get the file and concatenate the entire file to the
% output file.
for i=1:length(listOfParticipants)
    inFile = cog_comm_tools.openFileForRead(['participants/' listOfParticipants{i} '/' fileName]);
    fileEnd = false;
    
    % while there are lines to read, read them and concatenate them
    while(fileEnd == false)
        theBytes = fread(inFile);
        if (~isempty(theBytes))
            bytesWritten = bytesWritten + fwrite(outFile, theBytes);
        else
            % else write a new line character
            bytesWritten = bytesWritten + fwrite(outFile, 10);
            fileEnd = true;
        end
    end
    fclose(inFile);
end
fclose(outFile);