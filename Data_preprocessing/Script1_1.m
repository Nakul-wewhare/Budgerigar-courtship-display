% this script will filter the video to get different behaviour in different
% behaviours and it adds silence as a new note in audio and only singing as
% new behaviour in treatment 1,2,3 and then it converts continous events
% having a start and stop in continous time to discreate events in decreate
% time, only marked by presnce absence in a descreate unit of time 

%data naming, all data arrays will be called "data_"no of the treatment""
%eg data_3 for treatment 3, this array has time stamp and corresponing
%audio and video event, next number is the id of the bird(1-6) and next
%number says the day ( 1,2) a zero means all the numbers together 

%resolution of dicreatization
sample_rate=0.005;

%load audio  data
audio_data=combined_audio_data_array;

%add the one you want 
%1)all_behaviour_except_move
%2)all_display_and_affiliative
%3)all_display
%4)all_movements

%%% *results reamined same for particular behaviour in all 4 so only using
%%% data from 1* 

video_data=all_behaviour_except_move;

%table to help with for loops and data naming
table_for_data_naming=[13,15,12,142,16;18,21,17,192,20];

%from main script1 treatment 1, 2,3 are treatment 1 in sub1 here and 4 from main is 2 in sub1 here
treatment=1;

%go and change the suffix in eval function
suffix='data_1_';

if treatment==1
    combined_all_indivuals=[];

    for h=1:size(table_for_data_naming,2)
         combined_all_days=[];
         day=1;
        for z=[table_for_data_naming(1,h),table_for_data_naming(2,h)]
           
            % now we have reached the data per bird in a wat thaat we can
            % name it properly, so now we disect our data 
            audio_continous_array = audio_data(find(audio_data(:,1)==z),:);
            video_continous_array = video_data(find(video_data(:,1)==z),:);

            
            combined_all_bouts=[];

            for z = 1:10
                per_bout_audio=[];
                per_bout_video=[];

                per_bout_audio=audio_continous_array(find(audio_continous_array(:,2)==z),[3 4 5]);
                per_bout_video=video_continous_array(find(video_continous_array(:,2)==z),[3 4 5]);

                start=min([per_bout_video(:,1);per_bout_audio(:,1)]);
                finish =max([per_bout_video(:,2);per_bout_audio(:,2)]);

                % add silence in audio with 0.5s theshold, name code 108

                modified_bout_audio=[start per_bout_audio(1,1) 0; per_bout_audio; per_bout_audio(size(per_bout_audio,1),2) finish 0];

                start_bout_audio=[modified_bout_audio(1,:)];

                for j=2:size(modified_bout_audio,1)
                    if modified_bout_audio(j,1)-modified_bout_audio(j-1,2)>=0.5
                        start_bout_audio=[start_bout_audio;modified_bout_audio(j-1,2) modified_bout_audio(j,1) 108;modified_bout_audio(j,:)];
                        
                    else
                        start_bout_audio=[start_bout_audio;modified_bout_audio(j,:)];
                    end
                end

                % to take care of first behaviour

                if start_bout_audio(1,2)-start_bout_audio(1,1)>=0.5
                    start_bout_audio(1,3)=108;
                end

                % to take care of last

                if start_bout_audio(size(start_bout_audio,1),2)-start_bout_audio(size(start_bout_audio,1),1)>=0.5
                    start_bout_audio(size(start_bout_audio,1),3)=108;
                end

                % add singing only as new behaviour with threshold of 1
                % second, name code =11


                if size(per_bout_video,1)==0
                    modified_bout_video=[start start 0;finish finish 0];
                else
                    modified_bout_video=[start per_bout_video(1,1) 0; per_bout_video; per_bout_video(size(per_bout_video,1),2) finish 0];
                end


                start_bout_video=[modified_bout_video(1,:)];
               
                for j=2:size(modified_bout_video,1)
                    if modified_bout_video(j,1)-modified_bout_video(j-1,2)>=1
                        start_bout_video=[start_bout_video;modified_bout_video(j-1,2) modified_bout_video(j,1) 11;modified_bout_video(j,:)];
                        
                    else
                        start_bout_video=[start_bout_video;modified_bout_video(j,:)];
                    end
                end

                if start_bout_video(1,2)-start_bout_video(1,1)>=1
                    start_bout_video(1,3)=11;
                end
                if start_bout_video(size(start_bout_video,1),2)-start_bout_video(size(start_bout_video,1),1)>=1
                    start_bout_video(size(start_bout_video,1),3)=11;
                end

                % converting continous to dicreat 


                discreate_audio_perbout=event2timeseries(start_bout_audio,0.005,0,start,finish);
                discreate_video_perbout=event2timeseries(start_bout_video,0.005,0,start,finish);

                discreate_audio_video=[discreate_audio_perbout(:,[1 2]) discreate_video_perbout(:,2)];

                
                combined_all_bouts=[combined_all_bouts;discreate_audio_video];

            end

           % storing data per day 
           eval([suffix, num2str(h),'_', num2str(day),' = combined_all_bouts']);

           combined_all_days=[combined_all_days;combined_all_bouts];

           day =2
        end
        eval([suffix, num2str(h),'_0',' = combined_all_days']);

          combined_all_indivuals=[  combined_all_indivuals;combined_all_days];
    end
    eval([suffix,'0',' = combined_all_indivuals']);
end




if treatment==2
    combined_all_indivuals=[]

    for h=1:size(table_for_data_naming,2)
         combined_all_days=[]
         day=1
        for z=[table_for_data_naming(1,h),table_for_data_naming(2,h)]
           
            % now we have reached the data per bird in a wat thaat we can
            % name it properly, so now we disect our data 
            audio_continous_array = audio_data(find(audio_data(:,1)==z),:);
            video_continous_array = video_data(find(video_data(:,1)==z),:);

            
            combined_all_bouts=[]

            for z = 1:10
                per_bout_audio=[];
                per_bout_video=[];

                per_bout_audio=audio_continous_array(find(audio_continous_array(:,2)==z),[3 4 5]);
                per_bout_video=video_continous_array(find(video_continous_array(:,2)==z),[3 4 5]);

                start=min([per_bout_video(:,1);per_bout_audio(:,1)]);
                finish =max([per_bout_video(:,2);per_bout_audio(:,2)]);

                % add silence in audio with 0.5s theshold, name code 108

                modified_bout_audio=[start per_bout_audio(1,1) 0; per_bout_audio; per_bout_audio(size(per_bout_audio,1),2) finish 0];

                start_bout_audio=[modified_bout_audio(1,:)];

                for j=2:size(modified_bout_audio,1)
                    if modified_bout_audio(j,1)-modified_bout_audio(j-1,2)>=0.5
                        start_bout_audio=[start_bout_audio;modified_bout_audio(j-1,2) modified_bout_audio(j,1) 108;modified_bout_audio(j,:)];
                        
                    else;
                        start_bout_audio=[start_bout_audio;modified_bout_audio(j,:)];
                    end
                end

                % to take care of first behaviour

                if start_bout_audio(1,2)-start_bout_audio(1,1)>=0.5
                    start_bout_audio(1,3)=108;
                end

                % to take care of last

                if start_bout_audio(size(start_bout_audio,1),2)-start_bout_audio(size(start_bout_audio,1),1)>=0.5
                    start_bout_audio(size(start_bout_audio,1),3)=108;
                end

                % add singing only as new behaviour with threshold of 1
                % second, name code =18


                if size(per_bout_video,1)==0
                    modified_bout_video=[start start 0;finish finish 0];
                else
                    modified_bout_video=[start per_bout_video(1,1) 0; per_bout_video; per_bout_video(size(per_bout_video,1),2) finish 0];
                end


                start_bout_video=[modified_bout_video(1,:)];
               
                for j=2:size(modified_bout_video,1)
%                     if modified_bout_video(j,1)-modified_bout_video(j-1,2)>=1
%                         start_bout_video=[start_bout_video;modified_bout_video(j-1,2) modified_bout_video(j,1) 18;modified_bout_video(j,:)];
%                         
%                     else;
                        start_bout_video=[start_bout_video;modified_bout_video(j,:)];
%                     end
                end

%                 if start_bout_video(1,2)-start_bout_video(1,1)>=1
%                     start_bout_video(1,3)=18;
%                 end
%                 if start_bout_video(size(start_bout_video,1),2)-start_bout_video(size(start_bout_video,1),1)>=1
%                     start_bout_video(size(start_bout_video,1),3)=18;
%                 end

                % converting continous to dicreat 


                discreate_audio_perbout=event2timeseries(start_bout_audio,0.005,0,start,finish);
                discreate_video_perbout=event2timeseries(start_bout_video,0.005,0,start,finish);

                discreate_audio_video=[discreate_audio_perbout(:,[1 2]) discreate_video_perbout(:,2)];

                
                combined_all_bouts=[combined_all_bouts;discreate_audio_video];

            end

           % storing data per day 
           eval([suffix, num2str(h),'_', num2str(day),' = combined_all_bouts']);

           combined_all_days=[combined_all_days;combined_all_bouts]

           day =2
        end
        eval([suffix, num2str(h),'_0',' = combined_all_days']);

          combined_all_indivuals=[  combined_all_indivuals;combined_all_days]
    end
    eval([suffix,'0',' = combined_all_indivuals']);
end


