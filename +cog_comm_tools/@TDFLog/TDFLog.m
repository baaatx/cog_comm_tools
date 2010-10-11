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
    function obj = TDFLog(fileName)
        obj.fileName = fileName;
        obj.fileHandle = cog_comm_tools.openFileForAppend([obj.fileName]);
    end
    
    function add(obj,msg)
        fprintf(obj.fileHandle,'%s\t',char(msg));
    end

    function nextRow(obj)
        fprintf(obj.fileHandle,'%s\n' , '');
    end
   end % methods
end % classdef

