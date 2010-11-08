% 
% Prompt a participant to enter keyboard input by displaying a question.
% Waits until a carriage return (enter) or CTRL-C...
%
% Based on getEchoStringCentered() in PTB.
%
% Author: Brian Armstrong
%

function string = getStringInputWithQuestion(window, question)

% flush out any lingering text in buffer
FlushEvents('keyDown');

% Supress text to MATLAB windows
ListenChar(2);

% display the message for the first time...
cog_comm_tools.displayTextAtPosition(window, question, 200, 200);

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

    cog_comm_tools.drawTextAtPosition(window, question, 200, 200);
    cog_comm_tools.drawTextCentered(window, string);
    Screen('Flip', window);
end

% flush out any lingering text in buffer
FlushEvents('keyDown');

% unSupress text to MATLAB windows
ListenChar(1);