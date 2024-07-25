%in this script we modify the sequence in 4 different treatments
%1) remove repeats and gaps
%2) remove repeats and gaps, and add behaviour absent and note absent 
%3) keep the same 
%4) behaviour and note absent 
% we use function modify_sequence to modify 
% change the treatment number for function input and suffix at the end of
% the data output array

%%%% going with treatment 3 in the final as it makes most sense 

% Input arrays
%for n1 = 1:4
n1=1;
    for n2 = 1:5
        %for n3 = 0:2
        n3=0;
            % Generate the input array name dynamically
            input_array_name = sprintf('data_%d_%d_%d', n1, n2, n3);
            

            %%% change number here
            % Pass the input array through a function and get the output
            output_array = modify_sequence(eval(input_array_name),3);
            
            %%% change number here
                output_array_name = sprintf('%s_3', input_array_name);
                
                % Store the output array with the new name
                eval(sprintf('%s = output_array;', output_array_name));
            
        %end
    end
%end
% change here for all files too , this is just to run same modification on
% array with data from all birds

%%% change number here also at 2 places :)
data_1_0_0_3=modify_sequence(data_1_0,3);

% 
% data_2_0_0_3=modify_sequence(data_2_0,3);
% data_3_0_0_3=modify_sequence(data_3_0,3);
% data_4_0_0_3=modify_sequence(data_4_0,3);
