function [logodds, significant, count] = logodds_and_significance(DiscreateTime, StartNumNote, NoteEnd, StartBehav, EndBehav, title1, title2, names_table)

count = zeros(NoteEnd - StartNumNote + 1, EndBehav - StartBehav + 1);

for n = 1:size(DiscreateTime, 1)
    for i = StartNumNote:NoteEnd
        for j = StartBehav:EndBehav
            if DiscreateTime(n, 2) == i && DiscreateTime(n, 3) == j
                count(i - StartNumNote + 1, j - StartBehav + 1) = count(i - StartNumNote + 1, j - StartBehav + 1) + 1;
            end
        end
    end
end

datacount = count + 0.001;

% calculation row and coloum total

rowtotal=zeros(size(datacount,1),1);
for i=1:1:size(datacount,1)
    for j=1:1:size(datacount,2)
    rowtotal(i,1)=datacount(i,j)+rowtotal(i);
    end
end

coloumtotal=zeros(1,size(datacount,2));
for i=1:1:size(datacount,2)
    for j=1:1:size(datacount,1)
    coloumtotal(1,i)=datacount(j,i)+coloumtotal(1,i);
    end
end
coloumtotal=[coloumtotal sum(coloumtotal)];
count_matrix=[datacount rowtotal;coloumtotal];

% calculating expected values

exp=zeros(size(datacount));
for i=1:1:size(datacount,1)
    for j=1:1:size(datacount,2)
        exp(i,j)=(count_matrix(i,size(count_matrix,2))*count_matrix(size(count_matrix,1),j)/count_matrix(end,end)) ;
    end
end

odds = count ./ exp;
odds(odds == 0) = 1; % Avoid log of zero
logodds = log(odds);

pvalue = zeros(NoteEnd - StartNumNote + 1, EndBehav - StartBehav + 1);
x = DiscreateTime(:, 2);
per_num = 10000;
% Generate 900 random permutations
for l = 1:per_num
    x_rand(:, l) = x(randperm(length(x)));
end

% Calculate p-values using all 900 permutations
for i = StartNumNote:NoteEnd
    for j = StartBehav:EndBehav
        dist = [];
        for q = 1:per_num
            counter = 0;
            for n = 1:size(DiscreateTime, 1)
                if x_rand(n, q) == i && DiscreateTime(n, 3) == j
                    counter = counter + 1;
                end
            end
            counter = counter + rand / 100;
            random_odds = counter / exp(i - StartNumNote + 1, j - StartBehav + 1);
            random_logodds = log(random_odds); % Use natural log to match logodds calculation
            dist = [dist, random_logodds];
        end

        % Calculate p-value by counting the number of random log-odds greater than the observed log-odds
        observed_logodds = logodds(i - StartNumNote + 1, j - StartBehav + 1);
        p = sum(abs(dist) >= abs(observed_logodds)) / length(dist); % Two-tailed test
        pvalue(i - StartNumNote + 1, j - StartBehav + 1) = p;
    end
end

% Apply FDR correction
pvals = pvalue(:);
[sorted_pvals, sort_idx] = sort(pvals);
m = length(pvals);
FDR_threshold = (1:m)' * 0.05 / m;
is_significant = sorted_pvals <= FDR_threshold;

% Create a matrix of the same size as pvalue with FDR corrected significance
significance_mask = zeros(size(pvalue));
significance_mask(sort_idx(is_significant)) = 1;

% Only keep significant log odds ratios after FDR correction
significant = logodds .* significance_mask;

logodds = round(logodds, 2);
significant = round(significant, 2);

logodds = logodds(:, 1:11);
significant = significant(:, 1:11);
count = count(:, 1:11);

figure(1)
HeatmapWithCap(logodds, 1, -1, names_table{1:17, 1}, names_table{19:26, 1}, title1);

figure(2)
HeatmapWithCap(significant, 1, -1, names_table{1:17, 1}, names_table{19:26, 1}, title2);

end


