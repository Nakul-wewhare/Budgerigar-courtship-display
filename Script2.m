% we first load our workspace from data processing 
% then script2_1 to get log_odds ratio
% we now run script 2_2 to get threshold cretaria of 0.30

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

%% we next plot the log odds in script2_3

%% next we categorise using sript2_4

%% we use script2_4 to heirachial classification and summary plot