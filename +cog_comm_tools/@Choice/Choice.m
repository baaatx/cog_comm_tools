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