classdef ImageStim
   properties (SetAccess = private, GetAccess = public)
      key
      fileName
      imageData
      valid
   end
   properties  (SetAccess = public, GetAccess = public)
      startTime
      endTime
      xPos
      yPos
   end
   methods
       function obj = ImageStim(key, fileName, valid, xPos, yPos)
           obj.key = key;
           obj.fileName = fileName;
           obj.valid = valid;
           obj.xPos = xPos;
           obj.yPos = yPos;
           obj.imageData = imread(char(fileName));
       end
   end
end % classdef

