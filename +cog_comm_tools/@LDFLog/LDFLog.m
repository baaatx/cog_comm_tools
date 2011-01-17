% This is a handle class that represents a Line-Delimited Log file. To be used for
% logging textual data during an experiment or gathering information from a
% participant...  .add(msg) adds a new line.
%
% fileName - full path string of filename for your new log file
%
% overwrite - (optional) boolean for overwrite mode (otherwise append mode is
% used)
%
% Author: Brian Armstrong
%
classdef LDFLog < handle
   properties (SetAccess = private, GetAccess = public)
      fileName
      fileHandle
   end
   methods
    function obj = LDFLog(fileName, overwrite)
        obj.fileName = fileName;
        if (nargin < 2 || overwrite ~= true)
            obj.fileHandle = cog_comm_tools.openFileForAppend([obj.fileName]);
        else
            obj.fileHandle = cog_comm_tools.openFileForOverwrite([obj.fileName]);
        end
    end
    function add(obj,msg)
        fprintf(obj.fileHandle,['%s' '\n'],char(msg));
    end
   end % methods
end % classdef