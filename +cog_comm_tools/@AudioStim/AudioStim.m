% This is a class that represents a single audio stimulus used in an
% experiment.
%
% Author: Brian Armstrong
%
classdef AudioStim
   properties (SetAccess = private, GetAccess = public)
      keyCode
      wavFileName
      audioSamples
      audioFileSize
   end
   properties  (SetAccess = public, GetAccess = public)
      title
      valid
      lastStartTime
      lastEndTime
      audioLength
   end
   methods
       function obj = AudioStim(keyCode, wavFileName, title)
           % setting a title is optional
           if (nargin<3)
               obj.title = 'untitled audio file';
           else
               obj.title = title;    
           end
           
           % default that this is a valid stimulus
           obj.valid = true;
           
           % initialize stim object
           obj.keyCode = keyCode;
           obj.wavFileName = wavFileName;
           [obj.audioSamples, obj.audioFileSize] = wavread(wavFileName);
           obj.audioLength = (length(obj.audioSamples)) / obj.audioFileSize;
       end
   end
end % classdef