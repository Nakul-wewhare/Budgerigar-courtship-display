function HeatmapWithCap(transitionProbability, MaxValue, Min, Xlabel, Ylabels, titleText)
    % Store the original transitionProbability matrix
    originalTransitionProbability = transitionProbability;

    % Cap the values for the color bar
    cappedTransitionProbability = transitionProbability;
    cappedTransitionProbability(cappedTransitionProbability > MaxValue) = MaxValue;
    cappedTransitionProbability(cappedTransitionProbability < Min) = Min;

    % Create the heatmap using imagesc
    imagesc(cappedTransitionProbability);

    % Set the colormap
    colormap(parula);

    % Set color bar limits
    caxis([Min MaxValue]);
    
    % Add a colorbar
    colorbar;

    % Set the x and y axis labels
    set(gca, 'XTick', 1:length(Xlabel), 'XTickLabel', Xlabel,'FontSize', 16);
    set(gca, 'YTick', 1:length(Ylabels), 'YTickLabel', Ylabels,'FontSize', 16);

    % Add title
    title(titleText);

    % Display the actual values on the heatmap
    textStrings = num2str(originalTransitionProbability(:), '%0.1f'); % Convert to strings
    textStrings = strtrim(cellstr(textStrings)); % Remove any space padding
    [x, y] = meshgrid(1:size(originalTransitionProbability, 2), 1:size(originalTransitionProbability, 1));
    hStrings = text(x(:), y(:), textStrings(:), 'HorizontalAlignment', 'center');

    set(hStrings, 'Color', 'black')
    
end


