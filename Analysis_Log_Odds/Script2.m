%% this is the main script for the log odds analysis
% we first load our workspace from data processing 
% then script2_1 to get log_odds ratio
% we now run script 2_2 to get threshold cretaria of 0.285

% Loop through the bird indices and save the data as CSV files
for i = 0:5
    % Generate the variable names for each bird's data
    bird_S = eval(['data_1_', num2str(i), '_0_3_S']);
    bird_NS = eval(['data_1_', num2str(i), '_0_3_NS']);
    bird_C = eval(['data_1_', num2str(i), '_0_3_C']);
    
    % Save each data set as a CSV file using writematrix
    writematrix(bird_S, ['bird', num2str(i), '_S.csv']);
    writematrix(bird_NS, ['bird', num2str(i), '_NS.csv']);
    writematrix(bird_C, ['bird', num2str(i), '_C.csv']);
end

%% we next plot the log odds in script2_3 for the combined data 

%% plot for each indivual bird using script2_4

%% next using sript2_5 we plot for how many indivuals the high thresolf is crossed for each note and body movement combination

%% next using sript2_6 we get infomration about which exact indivuals croosed the creteria and what is there average value of log odds, to get a final summary of the data 