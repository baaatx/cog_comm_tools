function drawAndWait(screen, text, numsecs)

if nargin < 3
    numsecs = 1;
end
% Now horizontally and vertically centered:
DrawFormattedText(screen, text, 'center', 'center', 0);
Screen('Flip',screen);
WaitSecs(numsecs);