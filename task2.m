%% Make sure to run Task 1 first
%% Get all of the participant ID's
pivot_table = unique(proc_data{:,1});

%% Create pivot table from processed data

for dd = 1:size(pivot_table,1) %go through the participant column in pivot_table
  %Finding the average Log RT response time for GC_Cong
   %an individual participant ID
   pid1 = pivot_table(dd,1);
   %index for every GC_Cong and that individual participant ID
   idx1 = strcmp(proc_data.resultId, pid1{1}) & strcmp(proc_data.Congruence, 'GC_Cong'); 
   %compute a table with only the participant id with GC_Cong rows
   conditiontable1 = proc_data(idx1, :);
   %find the mean of every Log RT in that table
   gc_cong_a = mean([conditiontable1.LogRT]);
   %put that mean in the pivot table for the participant ID in column 2
   pivot_table{dd, 2} = gc_cong_a;
end

for dd = 1:size(pivot_table,1) %go through the row for GC_Incong, LogRT Mean
  %GC_Incong -> repeated comments from above
   pid1 = pivot_table(dd,1);
   idx1 = strcmp(proc_data.resultId, pid1{1}) & strcmp(proc_data.Congruence, 'GC_Incong');
   conditiontable1 = proc_data(idx1, :);
   gc_incong_a = mean([conditiontable1.LogRT]);
   pivot_table{dd, 3} = gc_incong_a;
end

for dd = 1:size(pivot_table,1) %go through the row for CN_Cong, LogRT Mean
  %CN_Cong
   pid1 = pivot_table(dd,1);
   idx1 = strcmp(proc_data.resultId, pid1{1}) & strcmp(proc_data.Congruence, 'CN_Cong');
   conditiontable1 = proc_data(idx1, :);
   CN_cong_a = mean([conditiontable1.LogRT]);
   pivot_table{dd, 4} = CN_cong_a;
end

for dd = 1:size(pivot_table,1) %go through the row for CN_Incong, LogRT Mean
  %CN_Incong
   pid1 = pivot_table(dd,1);
   idx1 = strcmp(proc_data.resultId, pid1{1}) & strcmp(proc_data.Congruence, 'CN_Incong');
   conditiontable1 = proc_data(idx1, :);
   cn_incong_a = mean([conditiontable1.LogRT]);
   pivot_table{dd, 5} = cn_incong_a;
end

%% Create and assign variable names to the pivot_table, convert to .CSV

%creating variable names
varNames = {'resultid', 'GC_Cong', 'GC_Incong','CN_Cong','CN_Incong'};

%assigning them to the table
final_table = cell2table(pivot_table,'VariableNames',varNames);

%exporting the table to CSV
writetable(final_table, 'pivot_table.csv');


