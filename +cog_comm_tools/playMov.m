% Wrapper for playing a MOV file on the screen
%
% window - the window pointer
%
% movFile - the movFile to play
%
%
% Author: Brian Armstrong
%
function playMov(window, movFile)
 % open the movie file
 [ moviePtr duration fps width height count ]= Screen('OpenMovie', window, movFile);
 
 % rate = 1 means normal speed playback
 rate = 1;
 [droppedframes] = Screen('PlayMovie', moviePtr, rate);