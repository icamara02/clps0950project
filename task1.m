raw_data = readtable ('/Users/icamara/Downloads/clps0950project/clps0950_rawdata.xlsx');
original_data ='/Users/icamara/Downloads/clps0950project/clps0950_rawdata.xlsx';
new_data = '/Users/icamara/Downloads/clps0950project/clps0950_processeddata.xlsx';
copyfile (original_data, new_data); %make a duplicate file of the raw data

proc_data = readtable ('/Users/icamara/Downloads/clps0950project/clps0950_processeddata.xlsx');

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
    disp ('Updated Data:'); %display updated data table
    disp(proc_data);
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
       disp ('Updated Data:');
       disp (proc_data);
       writetable (proc_data, new_data, 'Sheet','Gender', 'WriteVariableNames',true); 
   else
       disp ('No rows found to delete.');
   end 




