% Prompt a participant to enter keyboard input by displaying a question.
% Waits until a carriage return (enter) or CTRL-C...
% Based on getEchoStringCentered() in PTB.
%
% window - the window pointer
%
% question - the text string of the question to ask
%
%
% Author: Brian Armstrong
%
function string = getStringInputWithQuestion(window, question)

% starting position for drawing text
startXPos = 50;
startYPos = 50;

% use font color, and set background to opposing color...
fontColor = Screen('TextColor',window);
backgroundColor = cog_comm_tools.getColorComplement(fontColor);

% flush out any lingering text in buffer
FlushEvents('keyDown');

% Supress text to MATLAB windows
ListenChar(2);

% Add the message to question
question = [question '\n\n(press enter key when finished)'];

% display the message for the first time...
cog_comm_tools.displayTextAtPosition(window, question, startXPos, startYPos);

string = '';

while true
    % get a char from the keyboard
    char = GetChar;
    
    % switch on the char value
    switch (abs(char))
        % ctrl-C, enter, or return
        case {13, 3, 10}
            % finished so break out of the loop
            break;
        case 8
            % backspace
            if ~isempty(string)
                string = string(1:length(string)-1);
            end
        otherwise
            % contatinate the char to the string...
            string = [string char];
    end
    
    % update the screen
    cog_comm_tools.fillWindow(window, backgroundColor);
    cog_comm_tools.drawTextAtPosition(window, question, startXPos, startYPos);
    cog_comm_tools.drawTextCentered(window, string);
    cog_comm_tools.displayWindow(window);
end

% flush out any lingering text in buffer
FlushEvents('keyDown');

% unSupress text to MATLAB windows
ListenChar(1);