% Display image data in 'imageStim' to window.
%
% window - the window pointer
%
% imageStim - an imageStim object
%
%
% Author: Brian Armstrong
%
function displayImageStimMovingInALine(window, imageStim, endX, endY, numSteps, secondsToMove)

    startX = imageStim.xPos;
    startY = imageStim.yPos;

    dx = (endX - startX) / numSteps;
    dy = (endY - startY) / numSteps;

    dt = secondsToMove / numSteps;

    steps = 0;

     while(steps < numSteps )
         imageStim.setPosition(startX, startY);
         cog_comm_tools.displayImageStim(window, imageStim);

         startX = startX + dx;
         startY = startY + dy;

         WaitSecs(dt);

         steps = steps + 1;

     end

    