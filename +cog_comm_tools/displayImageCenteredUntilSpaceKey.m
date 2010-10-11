% Displays image file 'imageFileName' on the screen for 'delay' seconds.
%
function displayImageCenteredUntilSpaceKey(window, imageFileName)
    spaceKey = KbName('space');
    
    cog_comm_tools.displayImageCentered(window , imageFileName);

    proceed = false;
    
    while (proceed == false)
        KBWait();
        if (cog_comm_tools.checkForKeyPress(spaceKey))
            break;
        end
    end