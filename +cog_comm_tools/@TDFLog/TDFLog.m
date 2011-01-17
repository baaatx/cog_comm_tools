% This is a handle class that represents a Tab-Delimited Log file. To be used for
% logging textual data during an experiment. Use .add(msg) to add the next
% item to the log, use .nextRow() to move to the next row of the log.
%
% Constructor Parameters:
%
% fileName - full path string of filename for your new log file
%
% overwrite - (optional) boolean for overwrite mode (otherwise append mode
% is used). Set to true for overwrite mode.
%
%
% Author: Brian Armstrong
%
classdef TDFLog < handle
   properties (SetAccess = private)
      fileName
      fileHandle
   end
   methods
    function obj = TDFLog(fileName, overwrite)
        obj.fileName = fileName;
        if (nargin < 2 || overwrite ~= true)
            obj.fileHandle = cog_comm_tools.openFileForAppend([obj.fileName]);
        else
            obj.fileHandle = cog_comm_tools.openFileForOverwrite([obj.fileName]);
        end
    end
    
    function add(obj,msg)
        fprintf(obj.fileHandle,'%s\t',char(msg));
    end

    function nextRow(obj)
        lineSep = cog_comm_tools.getLineSeperator();
        fprintf(obj.fileHandle,['%s' lineSep] , '');
    end
   end % methods
end % classdef