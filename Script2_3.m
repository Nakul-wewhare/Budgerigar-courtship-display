%% this script will give error bars and colour coded 3d bar plot 

matrix1 = data_1_1_0_3_S;
matrix2 = data_1_2_0_3_S;
matrix3 = data_1_3_0_3_S;
matrix4 = data_1_4_0_3_S;
matrix5 = data_1_5_0_3_S;
matrix6 = (matrix1 + matrix2 + matrix3 + matrix4 + matrix5) / 5;


% Define custom tick labels for the x and y axes
x_labels = names_table{1:17, 1}; % Replace with your custom labels
y_labels = names_table{19:26, 1}; % Replace with your custom labels

% Calculate the standard deviation for each cell across matrices 1 to 6
std_dev = std([matrix1(:), matrix2(:), matrix3(:), matrix4(:), matrix5(:)], 0, 2);

% Reshape the standard deviation matrix to match the dimensions of matrix7
std_dev_matrix = reshape(std_dev, size(matrix6));

% Create a new figure for the combined 3D plot
figure(1);

% Get the dimensions of the matrix
[num_rows, num_cols] = size(matrix6);

% Define the width of each bar
%bar_width = 0.5 ;

% Create a meshgrid for the bars
[x, y] = meshgrid(1:num_cols, 1:num_rows);


% Create a 3D bar plot for the mean matrix (matrix7)
b = bar3(matrix6(:,1:11));
    
    % Set the same color limits for all plots
    %caxis([minValue, maxValue]);
    caxis([-1, 1]);
    
    colorbar;
    
    for k = 1:length(b)
        zdata = b(k).ZData;
        b(k).CData = zdata;
        b(k).FaceColor = "flat";
    end

% Add x and y labels
xlabel('Dance step');
ylabel('Note type');
zlabel('log odds ratio')


% Set the tick labels for the x and y axes
set(gca, 'XTick', 1:numel(x_labels), 'XTickLabel', x_labels);
set(gca, 'YTick', 1:numel(y_labels), 'YTickLabel', y_labels);

% Add a title or any other customization as needed
title('Combined');

% Plot error bars manually using lines
hold on;
for i = 1:numel(x)
    error_value = std_dev_matrix(i);
    x_loc = x(i);
    y_loc = y(i);
    
    % Draw vertical error bar
    line([x_loc, x_loc], [y_loc, y_loc], [matrix6(i) - error_value, matrix6(i) + error_value], 'Color', 'r','LineWidth', 1.5, 'LineStyle', ':');
    
    
end

zlim([-1.5, 1.5]);
hold off;



% %%%%%%%%%%%%%%%%
% for matrixIndex = 1:5
%     % Create a new figure for each matrix
%     figure;
%     
%     % Create a 3D bar plot for the current matrix
%     b = bar3(eval(['matrix', num2str(matrixIndex),'(:,1:11)']));
%     
%     % Set the same color limits for all plots
%     %caxis([minValue, maxValue]);
%     caxis([-1, 1]);
%     
%     colorbar;
%     
%     for k = 1:length(b)
%         zdata = b(k).ZData;
%         b(k).CData = zdata;
%         b(k).FaceColor = "flat";
%     end
%     
%     % Add x and y labels
%     xlabel('Dance step');
%     ylabel('Note type');
%     zlabel('Log odds ratio')
%     
%     % Set the tick labels for the x and y axes
%     set(gca, 'XTick', 1:numel(x_labels), 'XTickLabel', x_labels);
%     set(gca, 'YTick', 1:numel(y_labels), 'YTickLabel', y_labels);
%     
%     % Add a title or any other customization as needed
%     title(['Bird ', num2str(matrixIndex)]);
%     zlim([-1.5, 1.5]);
% end


% Calculate the mean matrix
mean_matrix = (matrix1 + matrix2 + matrix3 + matrix4 + matrix5) / 5;

% Calculate the standard deviation for each cell across the matrices
std_dev_matrix = std(cat(3, matrix1, matrix2, matrix3, matrix4, matrix5), 0, 3);

% Define custom tick labels for the x and y axes
x_labels = names_table{1:11, 1}; % Replace with your custom labels
y_labels = names_table{19:26, 1}; % Replace with your custom labels

% Create a cell array to store the mean and standard deviation as strings
mean_std_cell = cell(numel(y_labels) + 1, numel(x_labels) + 1);

% Populate the first row with x_labels
mean_std_cell(1, 2:end) = x_labels';

% Populate the first column with y_labels
mean_std_cell(2:end, 1) = y_labels;

% Populate the rest of the cell array with the mean and standard deviation in "mean, std_dev" format
for i = 1:numel(y_labels)
    for j = 1:numel(x_labels)
        mean_std_cell{i+1, j+1} = sprintf('%.2f, %.2f', mean_matrix(i, j), std_dev_matrix(i, j));
    end
end

% Convert the cell array to a table
mean_std_table = cell2table(mean_std_cell);

% Display the table
disp(mean_std_table);

% Save the table as a CSV file
writetable(mean_std_table, 'mean_std_table.csv', 'WriteVariableNames', false);