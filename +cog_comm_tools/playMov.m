% Wrapper for playing a MOV file on the screen
%
% Author: Brian Armstrong
%
function playMov(window, movFile)
 % open the movie file
 [ moviePtr duration fps width height count ]= Screen('OpenMovie', window, movFile);
 
 % rate = 1 means normal speed playback
 rate = 1;
 [droppedframes] = Screen('PlayMovie', moviePtr, rate);

