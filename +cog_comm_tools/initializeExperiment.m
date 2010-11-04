% Initialize Experiment
%
% This function should be called at the begining of any new experiment.
%
% Author: Brian Armstrong
function initializeExperiment()
    % clear any lingering text from the MATLab console.
    clc;
    
    % clear all variables in the MATLab workspace
    clear;
    
    % Assert Open GL is installed and is working properly.
    AssertOpenGL;
    
    % Initialize the sound driver:
    InitializePsychSound;
    
    % Hide the Cursor
    HideCursor;  
 
    % Explicitly seed MATLABs RandStream to the clock for unique random
    % streams...
    RandStream.setDefaultStream(RandStream('mt19937ar','seed',sum(100*clock)));
