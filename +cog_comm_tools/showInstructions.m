% Show instructions in 'str' on the screen (pass in the window reference).
% Wait 'delay' long before allowing to continue by pressing any key.
%
function showInstructions(window, str, delay)
    FlushEvents('keyDown');
    DrawFormattedText(window, [str '\n\n\n(Press Any Key To Continue)'], 150, 'center', 0, 55, [], [],1.5);
    Screen('Flip',window);
    WaitSecs(delay);
    KbWait();
