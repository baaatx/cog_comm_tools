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
       function obj = Choice(keyValue, value)
           % just the string we show for that option
           obj.keyString = keyValue;

           % get the key object for that key
           obj.keyValue = KbName(keyValue);
           
           % This is the value we return if this choice is selected.
           obj.value = value;
       end
   end
end % classdef