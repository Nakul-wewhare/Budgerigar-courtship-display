
% Input arrays
n1 = 1;
n3 = 0;
n4 = 3;

for n2 = 1:5
    % Generate the input array name dynamically
    input_array_name = sprintf('data_%d_%d_%d_%d_S', n1, n2, n3, n4);
    
    % Generate the graph title
    
    titleText = sprintf('Bird %d', n2);
    
    % Evaluate the input array
    input_array = eval(input_array_name);

    

    
    % Call the HeatmapWithCap function
    HeatmapWithCap(input_array, 1, -1, names_table{1:17, 1}, names_table{19:26, 1}, titleText);
    
    % Add x and y axis labels outside the function
    xlabel('Body movement'); % Replace with actual x-axis label
    ylabel('Note type'); % Replace with actual y-axis label
    
    % Pause to allow visualization of each heatmap
    pause;
end
