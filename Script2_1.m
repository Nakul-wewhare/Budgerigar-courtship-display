% this script will get significant and non signifact odds ratio and plot
% them on a heatmap


% Specify the folder to save the graphs
folder = 'heatmaps';

% Create the folder if it does not exist
if ~exist(folder, 'dir')
    mkdir(folder);
end

% Input arrays
%for n1 = 1:4
n1=1;
    for n2 = 1:5
      %  for n3 = 0:2
      n3=0;
           % for n4 = 1:4
           n4=3;
                % Generate the input array name dynamically
                input_array_name = sprintf('data_%d_%d_%d_%d', n1, n2, n3, n4);
                
                % Generate the graph titles
                t1 = sprintf('logodds ratio for %s', input_array_name);
                t2 = sprintf('significant logodds ratio for %s', input_array_name);
                
                % Pass the input array through a function and get the output matrices
                [m1, m2, m3] = logodds_and_significance_modified(eval(input_array_name),101,108,1,17, t1, t2,names_table);
                
                
                % Generate the output matrix names with the suffixes "_NS" and "_S"
                m1_name = sprintf('%s_NS', input_array_name);
                m2_name = sprintf('%s_S', input_array_name);
                m3_name = sprintf('%s_C', input_array_name);
                
                % Save the output matrices with the new names
                eval(sprintf('%s = m1;', m1_name));
                eval(sprintf('%s = m2;', m2_name));
                eval(sprintf('%s = m3;', m3_name));
                
                % Save the graphs as files with their titles as names
                graph1_filename = fullfile(folder, sprintf('%s.png', strrep(t1, ' ', '_')));
                graph2_filename = fullfile(folder, sprintf('%s.png', strrep(t2, ' ', '_')));
                
                % Open Figure 1 and set properties
                figure;
                set(gcf, 'Position', get(0, 'Screensize')); % Open as full window
                
                % Save Figure 1
                saveas(gcf, graph1_filename);
                
                % Open Figure 2 and set properties
                figure;
                set(gcf, 'Position', get(0, 'Screensize')); % Open as full window
                
                % Save Figure 2
                saveas(gcf, graph2_filename);
     end
           





% Specify the folder to save the graphs
folder = 'path/to/folder';

% Create the folder if it does not exist
if ~exist(folder, 'dir')
    mkdir(folder);
end

% Input arrays
%for n1 = 1:4
n1=1
    %for n4 = 1:4
    n4=3
        % Generate the input array name dynamically
        input_array_name = sprintf('data_%d_0_0_%d', n1, n4);
        
        % Generate the graph titles
        t1 = sprintf('logodds ratio for %s', input_array_name);
        t2 = sprintf('significant logodds ratio for %s', input_array_name);
        
        % Pass the input array through a function and get the output matrices
        [m1, m2,m3] = logodds_and_significance_modified(eval(input_array_name),101,108,1,17, t1, t2,names_table);
        
        % Generate the output matrix names with the suffixes "_NS" and "_S"
        m1_name = sprintf('%s_NS', input_array_name);
        m2_name = sprintf('%s_S', input_array_name);
        m3_name = sprintf('%s_C', input_array_name);
        
        % Save the output matrices with the new names
        eval(sprintf('%s = m1;', m1_name));
        eval(sprintf('%s = m2;', m2_name));
        eval(sprintf('%s = m3;', m3_name));
        
        % Save the graphs as files with their titles as names
        graph1_filename = fullfile(folder, sprintf('%s.png', strrep(t1, ' ', '_')));
        graph2_filename = fullfile(folder, sprintf('%s.png', strrep(t2, ' ', '_')));
        
        % Open Figure 1 and set properties
        figure;
        set(gcf, 'Position', get(0, 'Screensize')); % Open as full window
        
        % Save Figure 1
        saveas(gcf, graph1_filename);
        
        % Open Figure 2 and set properties
        figure;
        set(gcf, 'Position', get(0, 'Screensize')); % Open as full window
        
        % Save Figure 2
        saveas(gcf, graph2_filename);



%%%%%%%%%%%%%%%%%
HeatmapWithCap(data_1_1_0_3_S, 1, -1, names_table{1:17, 1}, names_table{19:26, 1}, 'title1')
 