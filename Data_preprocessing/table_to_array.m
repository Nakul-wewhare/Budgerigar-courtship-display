function[audio_array,video_array]=table_to_array(audio_table,video_table,name_codes)

% this function converts table to array and assings number codes to our
% names 

%place in table were notes start
note_start =19;

%place in table were notes end
note_end = 25;

%place in table were behavior start
behaviour_start = 1;

%place in table were behavior end
behaviour_end = 17;


audio_array_name_codes=zeros(size(audio_table,1),1);
for n=1:1:size(audio_table,1)
    for m=note_start:1:note_end
        if  strcmp(audio_table{n,5},name_codes{m,1})
            
            audio_array_name_codes(n,1)=name_codes{m,2};
        end
    end
end

video_array_name_codes=zeros(size(video_table,1),1);
for n=1:1:size(video_table,1)
    for m=behaviour_start:1:behaviour_end
        if  strcmp(video_table{n,5},name_codes{m,1})
            
            video_array_name_codes(n,1)=name_codes{m,2};
        end
    end
end

audio_array = [table2array(audio_table(:,[1 2 3 4])) audio_array_name_codes];
video_array = [table2array(video_table(:,[1 2 3 4])) video_array_name_codes];

end
