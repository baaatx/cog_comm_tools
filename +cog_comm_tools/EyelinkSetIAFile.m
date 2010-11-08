% Wrapper for setting the Area of Interest File for an Eyelink Trial.
%
% IAfileName - the name of the IA file to set as default for the current
% trial (or entire EDF file)
%
% NOTE: Area of Interest (IAS) files should be stored in the
% 'stimuli/segments' folder in the experiment folder.
%
% The path that is added is relative to the EDF file for the
% trial(s).  So when you open the EDF, this message will auto-associate the
% IA File with the trial within which this message was sent... This happens
% inside of Data Viewer upon opening the file...
%
%
% Author: Brian Armstrong
%
function EyelinkSetIAFile(IAfilename)
     Eyelink('Message', ['!V IAREA FILE ' '../../../stimuli/segments/' IAfilename]);  