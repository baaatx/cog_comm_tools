% This is a class that represents a single image stimulus used in an
% experiment. 
%
%  ImageStim Constructor Parameters:
%
%  keyCode - the (string) keyCode for the image stim
%  
%  fileName - the full path fileName of the image file to create the image stim from...
%
%  xPos - (optional) initial x position for initializing destRect
%
%  yPos - (optional) initial y position for initializing destRect
%
%  title - (optional) a (string) title for the stim
% 
%
% Author: Brian Armstrong
%
classdef ImageStim < handle
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
           
           % check we have enough arguments...
           if (nargin < 2)
               error('not enough arguments passed to create an ImageStim object.');
           end
                      
           % setting an intial X position is optional
           if (nargin < 3)
               obj.xPos = 0;
               xPos = 0;
           else
               obj.xPos = xPos;
           end
           
           % setting an intial Y position is optional
           if (nargin < 4)
               obj.yPos = 0;
               yPos = 0;
           else
               obj.yPos = yPos;
           end
           
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
       
       function setPosition(obj, xPos, yPos)
           
           % set the position cooridantes
           obj.xPos = xPos;
           obj.yPos = yPos;
                      
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
end% classdef