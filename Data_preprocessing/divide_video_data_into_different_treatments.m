function[all_behaviour_except_move,all_display_and_affiliative,all_display,all_movements]=divide_video_data_into_different_treatments(array_video_data)
all_behaviour_except_move=[];
all_display_and_affiliative=[];
all_display=[];
all_movements=[];

for k=1:1:length(array_video_data)


    if array_video_data(k,5)~=17
     all_behaviour_except_move=[all_behaviour_except_move;array_video_data(k,:)];
    end

valid_values_all_display_and_affiliative = [1, 2, 3, 4, 5, 6,7,8,9,10];
valid_values_display = [1, 2, 3, 4, 5, 6, 7];
valid_values_movements = [15, 16, 17];

if ismember(array_video_data(k, 5), valid_values_all_display_and_affiliative)
    all_display_and_affiliative = [all_display_and_affiliative; array_video_data(k, :)];
end


if ismember(array_video_data(k, 5), valid_values_display)
    all_display = [all_display; array_video_data(k, :)];
end

if ismember(array_video_data(k, 5), valid_values_movements)
    all_movements = [all_movements; array_video_data(k, :)];
end

end
end