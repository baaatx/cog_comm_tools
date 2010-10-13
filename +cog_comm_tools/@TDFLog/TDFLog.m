% This is a class that represents a Tab-Delimited Log file. To be used for
% logging textual data during an experiment.
%
% Author: Brian Armstrong
%
classdef TDFLog
   properties (SetAccess = private)
      fileName
      fileHandle
   end
   methods
    %
    % fileName = full path string of filename for your new log file
    % overwrite = boolean for overwrite mode (otherwise append mode is
    % used)
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
        fprintf(obj.fileHandle,'%s\n' , '');
    end
   end % methods
end % classdef

