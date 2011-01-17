% This is a class that represents a single textual question, used to
% encapsulate a question's information (code, questionText, and answerText).
%
% Constructor Parameters:
%
% keyCode - (string) the question keyCode (like a stim keyCode)
%
% questionText - (string) the text of the question
%
% answerText - (string) the answer text for the question (the 'correct'
% answer)
% 
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
           
           % answerText is optional...
           if (nargin<3)
               answerText = 'n/a';
           end
           
           % just the string we show for that option
           obj.keyCode = keyCode;
           obj.questionText = questionText;
           obj.answerText = answerText;
       end
   end
end % classdef