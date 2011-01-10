% Function that displays the instructions in 'str' on the screen. 
% Wait 'delay' long before allowing to continue. You can allow the user
% to continue by either the 'mouse', the 'keyboard', or the eyelink 'joystick'. 
%
% window - the window pointer
%
% instructionsText - the instructions text string  
%
% delay (optional) - how long in seconds to wait before allowing them to continue
%
% continueType (optional) - string specifiying how to let the participant continue.
% Can be 'mouse' or 'joystick', default is 'keyboard'
%
% backgroundColor (optional) - the desired background color (RGB [red green
% blue] value or single int for grayscale.
%
% fontColor (optional) - the desired font color (RGB [red green
% blue] value or single int for grayscale.
%
%
% Author: Brian Armstrong
%
function displayInstructions(window, instructionsText, delay, continueType, backgroundColor, fontColor)
    
    % display start positions...
    xPos = 50;
    yPos = 50;
    
    % get the line wrap value
    wrapAt = cog_comm_tools.getWrapAt(window);
    
    if (nargin < 3)
        % default delay before allowing them to continue is a third of a
        % second...
        delay = 0.33;
    end
    
    if (nargin < 4)
        % default continueType is keyboard
        continueType = 'keyboard';
    end

    % default background color is complement of text color...
    if (nargin < 5)
        backgroundColor = cog_comm_tools.getColorComplement(Screen('TextColor', window));
    end
    
    % default font color is the Screen's font color
    if (nargin < 6)
        fontColor = Screen('TextColor', window);
    end
    
    % flush lingering keypresses to avoid skipping over instructions...
    FlushEvents('keyDown');

    % set message based on type of continue mode
    if (strcmp(continueType, 'mouse'))
        instructionsText = [instructionsText '\n\n\n(Click Any Button on Mouse To Continue)'];
    elseif (strcmp(continueType, 'joystick'))
        instructionsText = [instructionsText '\n\n\n(Press Any Joystick Button To Continue)'];
    else 
        instructionsText = [instructionsText '\n\n\n(Press Any Key To Continue)'];
    end
    
    % display the text on the screen.
    cog_comm_tools.displayTextAtPosition(window, instructionsText, xPos, yPos, backgroundColor, fontColor, wrapAt);
    
    %DrawFormattedText(window, instructionsText, 150, 'center', 0, 55, [], [],1.5);
    %cog_comm_tools.drawWindow(window);

    WaitSecs(delay);

    if (strcmp(continueType, 'mouse'))
        GetClicks();
    elseif (strcmp(continueType, 'joystick'))
        cog_comm_tools.joyStickWaitForButton();
    else
        % supress text from matlab window
        ListenChar(2);
        KbWait();
        % un-supress text from matlab window
        ListenChar(1);
    end