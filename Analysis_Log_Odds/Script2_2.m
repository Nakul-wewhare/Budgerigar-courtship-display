%% this script will give the thrshold creterai of calling a log odds high

% Combine bird data into a single array
bird1_S = data_1_1_0_3_S(:);
bird2_S = data_1_2_0_3_S(:);
bird3_S = data_1_3_0_3_S(:);
bird4_S = data_1_4_0_3_S(:);
bird5_S = data_1_5_0_3_S(:);

data = [bird1_S; bird2_S; bird3_S; bird4_S; bird5_S];
data = data(:);

% Sort the data
sorted_data = sort(data);

% Calculate the 80th percentile
percentile_80 = prctile(sorted_data, 80);

% Create a new figure for the ranked data plot
figure(2);

% Sort the data based on z-values
[~, z_sort_order] = sort(data);

% Create a bar graph of the ranked data
bar(data(z_sort_order));

% Add labels and title
xlabel('Rank (Based on log odds)');
ylabel('Log odds ratio');
title('Ranked log odds');

% Add a grid for better visualization
grid on;

% Find the rank corresponding to the 80th percentile
rank_80 = find(data(z_sort_order) >= percentile_80, 1);

% Draw a dotted line at the rank where value crosses the 80th percentile
hold on;
line([rank_80, rank_80], [min(data(z_sort_order)), max(data(z_sort_order))], 'Color', 'g', 'LineStyle', '--', 'LineWidth', 1.5);
text(rank_80, max(data(z_sort_order)), ['80th Percentile: ', num2str(percentile_80)], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left', 'Color', 'g');

hold off;


