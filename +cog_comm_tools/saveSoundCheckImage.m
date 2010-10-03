% Function saves the sound check image for the participant after
% the soundcheck audio file has been recorded.
%
% Functions expects a sound check audio file to be present in subject's
% folder... (Don't call this, it is used by fullSoundCheck)
%
% participantId - unique id of participant
%
% minY - minimum threadhold for sound wave amplitude
%
% maxY - maximum threadhold for sound wave amplitude
%
%
% Author: Brian Armstrong
%
function saveSoundCheckImage(participantId, minY, maxY)

    % get data from wave file
    [x,fs] = wavread(['participants/' participantId '/audio/soundCheck.wav']);
    
    % specify time 
    t = (1:length(x))/fs;
    
    % create the plot
    h = plot(t,real(x));
    
    title(['Sound Check for participant: ' participantId]);
    
    % set our bounds
    limits = [0 10 -1 1];
    
    % reset the maximum t axis as the time length of the file
    limits(2) = length(x)/fs;
    axis(limits);

    topPos = [];
    bottomPos = [];
    topNeg = [];
    bottomNeg = [];
    
    % draw the maximum threshold boundaries
    hold all 
    
    for i=1:length(x)/fs
        topPos(i) = maxY;
        bottomPos(i)= minY;
        topNeg(i) = - maxY;
        bottomNeg(i) = -minY;
    end
 
    plot (topPos);
    
    text(0,maxY,'Upper Bound', 'HorizontalAlignment','left');
    
    hold all 
        
    plot (topNeg);
    
    text(0,-maxY,'Upper Bound', 'HorizontalAlignment','left');
        
    % draw the minimum threashold boundaries

    hold all 
    
    plot (bottomPos);
    
    text(0,minY,'Lower Bound', 'HorizontalAlignment','left');
    
    hold all 
    
    plot (bottomNeg);
    
    text(0,-minY,'Lower Bound', 'HorizontalAlignment','left');
        
    % save the figure as a jpg file
    saveas(h,['participants/' participantId '/images/soundCheckImage.jpg'],'jpg');
    
    % close the plot window (plotting causes this window to open)
    close