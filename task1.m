%% Instructions: Run this task1 first

%% Import and read raw data
raw_data = readtable ('clps0950_rawdata.xlsx');
original_data ='clps0950_rawdata.xlsx';
new_data = 'clps0950_processeddata.xlsx';
copyfile (original_data, new_data); %make a duplicate file of the raw data

proc_data = readtable ('clps0950_processeddata.xlsx');

%% Goal 1: remove any blank columns in which there is no variable in the first row 
proc_data (:,6:10) = [];

%% Goal 2: delete rows in which the "Congruency" column has "CN_Neutral", "GC_Neutral" or "practice"
congruence_column = 'Congruence'; %column to check for variables
% list of variables to delete 
delete_variables = {'CN_Neutral', 'GC_Neutral', 'GC_PracticeInstr', 'CN_PracticeInstr', 'CN_Cong_Practice', 'GC_Cong_Practice','GC_Incong_Practice', 'CN_Incong_Practice', 'GC_Neutral_Practice'};

%identify rows containing delete_variables and delete the corresponding rows
rows_delete = ismember(proc_data.(congruence_column),delete_variables);
if any (rows_delete) %delete rows if there are any to delete
    proc_data(rows_delete, :)= [];
    
    writetable(proc_data, new_data, 'Sheet','Processed_data','WriteVariableNames', true); %save updated data to same file
else 
        %Display message if no rows are found to delete 
        disp ('No rows found to delete.');
end
%% Goal 3: Remove any row in which under the “gender” column the response is “spacebar”
gender_column= 'Gender'; %column to check
rows_spacebar = cellfun(@isempty, proc_data.(gender_column)); %rows containing empty cells
   if any (rows_spacebar) %delete any rows within the column that are empty
       proc_data(rows_spacebar, :) = [];
       
       writetable (proc_data, new_data, 'Sheet','Gender', 'WriteVariableNames',true); 
   else
       disp ('No rows found to delete.');
   end 
%% Goal 4: Remove any row in which there is "text" (these are just instruction slides) under the "Content" column 
content_column= 'content'; %column to check for 'text'
delete_text = {'text'}; 
%identify rows containing 'text' and delete the corresponding rows
rows_text= ismember(proc_data.(content_column),delete_text); %rows containing text 
    if any (rows_text) %delete any rows in which 'text' is in the 'content' column
        proc_data(rows_text, :)=[];

        writetable(proc_data, new_data, 'Sheet','Processed_data', 'WriteVariableNames',true); %save updated data to the same file
    else 
        disp ('No rows found to delete.');
    end

disp ('Result: clps0950_processeddata.xlsx contains the processed data from clps0950_rawdata.xlsx')