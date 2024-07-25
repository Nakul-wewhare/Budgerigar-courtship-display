% Define threshold
num = 0.285;

% Extract custom labels for x and y axes
x_labels = names_table{1:11, 1}; % Custom labels for columns (assuming 11 columns)
y_labels = names_table{19:26, 1}; % Custom labels for rows (assuming 7 rows)

% Initialize cell array to store combined matrix names and average values
[num_rows, num_cols] = size(matrix1);  % Assuming all matrices are the same size
combined_data = cell(num_rows, num_cols);

% Names of the matrices (individuals)
matrix_names = {'1', '2', '3', '4', '5'};

% Calculate which matrices exceed the threshold and store their names and average values
for i = 1:num_rows
    for j = 1:num_cols
        % Find indices of matrices that exceed the threshold for this cell
        values = [matrix1(i, j), matrix2(i, j), matrix3(i, j), matrix4(i, j), matrix5(i, j)];
        contributing_indices = find(values >= num);
        
        if ~isempty(contributing_indices)
            % Store the names of matrices that cross the threshold
            names_str = strjoin(matrix_names(contributing_indices), ', ');
            
            % Calculate and store the average value of the matrices that cross the threshold
            avg_value = mean(values(contributing_indices));
            
            % Store combined data in cell array
            combined_data{i, j} = sprintf('%s (%.2f)', names_str, avg_value);
        else
            combined_data{i, j} = '';  % No matrices cross the threshold
        end
    end
end

% Convert the cell array to a table
combined_table = cell2table(combined_data);

% Display the table in a UI figure
fig = uifigure('Name', 'Threshold Crossings and Average Values');
uit = uitable(fig, 'Data', combined_table{:,:}, 'ColumnName', x_labels, 'RowName', y_labels);

% Adjust the table's column widths for better visibility
uit.ColumnWidth = 'auto';

%%%%%%%%%%%%%%%%


% Define threshold
num = 0.285;

% Trim matrices to include only the first 11 columns


% Initialize cell array to store which matrices cross the threshold
[num_rows, num_cols] = size(matrix1);  % Assuming all matrices are the same size
threshold_crossings = cell(num_rows, num_cols);

% Names of the matrices (individuals)
matrix_names = {'1', '2', '3', '4', '5'};

% Calculate which matrices exceed the threshold and store their names
for i = 1:num_rows
    for j = 1:num_cols
        % Find indices of matrices that exceed the threshold for this cell
        contributing_indices = find([matrix1(i, j) >= num, matrix2(i, j) >= num, matrix3(i, j) >= num, matrix4(i, j) >= num, matrix5(i, j) >= num]);
        
        if ~isempty(contributing_indices)
            % Store the names of matrices that cross the threshold
            threshold_crossings{i, j} = strjoin(matrix_names(contributing_indices), ', ');
        else
            threshold_crossings{i, j} = '';  % No matrices cross the threshold
        end
    end
end

% Flatten the threshold_crossings cell array into a single cell array of strings
flat_crossings = reshape(threshold_crossings, [], 1);

% Remove empty entries
flat_crossings = flat_crossings(~cellfun('isempty', flat_crossings));

% Count occurrences of each unique combination
[unique_combinations, ~, idx] = unique(flat_crossings);
combination_counts = histc(idx, unique(idx));

% Count the number of individuals in each combination
num_individuals = cellfun(@(x) numel(strsplit(x, ', ')), unique_combinations);

% Sort by the number of individuals and then by counts
[~, sort_idx] = sortrows([num_individuals, combination_counts], [-1, -2]);

% Sort combinations and counts accordingly
sorted_combinations = unique_combinations(sort_idx);
sorted_counts = combination_counts(sort_idx);

% Plot the counts as a bar plot
figure(1);
bar(sorted_counts);
set(gca, 'XTickLabel', sorted_combinations, 'XTick', 1:numel(sorted_combinations), 'XTickLabelRotation', 45);
xlabel('Combinations of Individuals');
ylabel('Occurrences');
title('Occurrences of Each Unique Combination of Individuals Crossing the Threshold');
