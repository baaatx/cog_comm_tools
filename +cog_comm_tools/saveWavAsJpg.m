% Function saves a WAV file with 'wavFileName' into jpg specified by
% 'jpgFileName'. Use this for visualizing a wave file.
% (Or use as a template for writing your own similar function.)
%
% wavFileName - the input WAV file to draw
%
% jpgFileName - the output JPG file to save
%
%
% Author: Brian Armstrong
%
function saveWavAsJpg(wavFileName, jpgFileName)
    % get data from wave file
    [x,fs] = wavread(wavFileName);
    
    % specify time 
    t = (1:length(x))/fs;
    
    % create the plot
    h = plot(t,real(x));
    
    % set our bounds - max T is file time
    axisData = [0 10 -1 1];
    axisData(2) = length(x)/fs;
    axis(axisData);
    
    % save the file
    saveas(h,jpgFileName,'jpg');
    
    % close the plot window (plotting causes this window to open)
    close