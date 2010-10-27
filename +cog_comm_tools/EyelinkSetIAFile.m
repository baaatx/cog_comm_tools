% Wrapper for setting the Area of Interest File for an Eyelink Trial.
%
% Note: Area of Interest (IAS) files should be stored in the
% 'stimuli/segments' folder in the experiment folder.
%
% Note: the path that is added is relative to the EDF file for the
% trial(s).  So when you open the EDF, this message will auto-associate the
% IA File with the trial within which this message was sent...
%
% Author: Brian Armstrong
%
function EyelinkSetIAFile(IAfilename)
     Eyelink('Message', ['!V IAREA FILE ' '../../../stimuli/segments/' IAfilename]);  