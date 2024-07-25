% Your existing code ...

% Create matrix8 (the number of times values in matrices 1 to 5 are equal to or greater than 0.3)
num = 0.285;
matrix1 = matrix1(:,1:11);
matrix2 = matrix2(:,1:11);
matrix3 = matrix3(:,1:11);
matrix4 = matrix4(:,1:11);
matrix5 = matrix5(:,1:11);

matrix7 = (matrix1 >= num) + (matrix2 >= num) + (matrix3 >= num) + (matrix4 >= num) + (matrix5 >= num);
matrix10 = zeros(num_rows, num_cols);

for i = 1:num_rows
    for j = 1:num_cols
        contributing_indices = find([matrix1(i, j) >= num, matrix2(i, j) >= num, matrix3(i, j) >= num, matrix4(i, j) >= num, matrix5(i, j) >= num]);
        if ~isempty(contributing_indices)
            % Select only the matrices that cross the threshold for this cell
            matrices_to_average = [matrix1(i, j), matrix2(i, j), matrix3(i, j), matrix4(i, j), matrix5(i, j)];
            matrix10(i, j) = mean(matrices_to_average(contributing_indices));
        end
    end
end

% Create a new figure for the 3D bar plot of matrix8
figure(1);
[num_rows, num_cols] = size(matrix7);
[x, y] = meshgrid(1:num_cols, 1:num_rows);
b = bar3(matrix7);
caxis([0, 5]); % Adjust based on your data
colorbar;

for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = "flat";
end

xlabel('Body Movement');
ylabel('Note type');
zlabel('Occurrences >= 0.285');
set(gca, 'XTick', 1:numel(x_labels), 'XTickLabel', x_labels);
set(gca, 'YTick', 1:numel(y_labels), 'YTickLabel', y_labels);
title('Occurrences >= 0.285');

set(gcf, 'Renderer', 'painters');


