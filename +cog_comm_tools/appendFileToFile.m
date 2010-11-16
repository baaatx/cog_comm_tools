% Function for appending an input text file to a (master) output text file.
% (Adds new line char(s) at end to be ready for next append.)
%
% inputFileName - experiment folder relative filename of input text file
%
% outputFileName - experiment folder relative filename to the output file (master)
%
%
% Author: Brian Armstrong
%
function bytesWritten = appendFileToFile(inputFileName, outputFileName)

% set proper line seperator
if (IsWindows())
    % use windows style new line chars
    lineSep = [13 10];    
else
    % use unix style new line char
    lineSep = 10;
end

% the output file handle
outFile = cog_comm_tools.openFileForAppend(outputFileName);

% the counter for the number of bytes we write out to the output file.
bytesWritten = 0;

% get the input file and concatenate the entire file to the
% output file...
inFile = cog_comm_tools.openFileForRead(inputFileName);
fileEnd = false;
    
% while there are lines to read, read them and concatenate them
while(fileEnd == false)
    theBytes = fread(inFile);
    if (~isempty(theBytes))
        bytesWritten = bytesWritten + fwrite(outFile, theBytes);
    else
        % else write 'new line' character(s)
        bytesWritten = bytesWritten + fwrite(outFile, lineSep);
        fileEnd = true;
    end
end

% close the file handles
fclose(inFile);
fclose(outFile);