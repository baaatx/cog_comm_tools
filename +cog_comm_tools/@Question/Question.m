% This is a class that represents a single textual question, used to
% encapsulate a question's information (code, questionText, and answerText).
%
% Author: Brian Armstrong
%
classdef Question
   properties
      keyCode
      questionText
      answerText
   end
   methods
       function obj = Question(keyCode, questionText, answerText)
           % just the string we show for that option
           obj.keyCode = keyCode;
           obj.questionText = questionText;
           obj.answerText = answerText;
       end
   end
end % classdef