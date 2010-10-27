% This is a class that represents a single image stimulus used in an
% experiment.
%
% Author: Brian Armstrong
%
classdef ImageStim
   properties (SetAccess = private, GetAccess = public)
      keyCode
      fileName
      imageData
   end
   properties  (SetAccess = public, GetAccess = public)
      title
      valid
      lastStartTime
      lastEndTime
      displayTime
      xPos
      yPos
      imageSize
      width
      height
      destRect
   end
   methods
       function obj = ImageStim(keyCode, fileName, xPos, yPos, title)
           % setting a title is optional
           if (nargin<5)
               obj.title = 'untitled image';
           else
               obj.title = title;    
           end
           
           % initialize stim object
           obj.keyCode = keyCode;
           obj.fileName = fileName;
           
           % default that this is a valid stimulus
           obj.valid = true;
           
           % set the position cooridantes
           obj.xPos = xPos;
           obj.yPos = yPos;
           
           % get image data and dimensions
           obj.imageData = imread(char(fileName));
           obj.imageSize = size(obj.imageData);
           obj.width = obj.imageSize(2);
           obj.height = obj.imageSize(1);
           
           % calculate coordinates for destRect
           minX = (xPos - (obj.width / 2));
           minY = (yPos - (obj.height / 2));
           maxX = (xPos + (obj.width / 2));
           maxY = (yPos + (obj.height / 2));
           obj.destRect = [minX minY maxX maxY];

           % round to nearest integer values
           obj.destRect = round(obj.destRect);
       end
   end
end % classdef