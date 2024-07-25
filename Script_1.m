% 1. load data , 2. discreatise the data, 3. select usefull behaviour 
% we load data in table formate

combined_audio_data_table=readtable('Budgie_Courtship_Raw_Anotations.xlsx','sheet', 1);
combined_video_data_table=readtable('Budgie_Courtship_Raw_Anotations.xlsx','sheet', 2);
ID_table=readtable('Budgie_Courtship_Raw_Anotations.xlsx','sheet', 3);
Behavior_Names=readtable('Behavior_Names.csv');

% now we convert table to array and give number codes to our names

[combined_audio_data_array,combined_video_data_array]=table_to_array(combined_audio_data_table,combined_video_data_table,Behavior_Names);

% for video data we process further and divide into 4 
% 1) all behaviour except movement - add silence later ## we should this
% for further analysis
% 2) all display and affiliative - add silence later
% 3) all display behaviour - add silence later
% 4) all movements 

[all_behaviour_except_move,all_display_and_affiliative,all_display,all_movements]=divide_video_data_into_different_treatments(combined_video_data_array)

%run script1_1 using treatment 1 and get datafiles in the format Data_treat no(1 in our case)_indivualID_day number( 0 = both days, 1 = first and 2 = second )   

%we further process the data using script1_2, in this we finally use
%treatment 3 

%% run script1_3 for the basic count analysis 

%% now we save the work space and open it in script2 for calulation of logodds ratio 









