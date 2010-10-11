% This is a class that represents a single choice in a textual multiple
% choice dialog.  For Use with the multipleChoiceDialog function.
%
% Author: Brian Armstrong
%
classdef Choice
   properties
      keyString
      keyValue
      value
   end
   methods
       function obj = Choice(keyString, keyValue, value)
           obj.keyString = keyString;
           obj.keyValue = keyValue;
           obj.value = value;
       end
   end
end % classdef