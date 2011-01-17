% This is a class that represents a single choice in a textual multiple
% choice dialog.  For Use with the multipleChoiceDialog and similar functions.
%
% Constructor Parameters:
%
% keyCode - the keyCode (or buttonName) associated with this choice.
%
% value - the value of this choice (what gets returned if they select this
% choice)
%
%
% Author: Brian Armstrong
%
classdef Choice
   properties
      keyCode
      value
   end
   methods
       function obj = Choice(keyCode, value)
           % just the string we show for that option
           obj.keyCode = keyCode;
           
           % This is the value we return if this choice is selected.
           obj.value = value;
       end
   end
end % classdef