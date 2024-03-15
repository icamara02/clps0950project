%importing file

%getting all of the participant ID's
pivot_table = unique(proc_data{:,1});

for dd = 1:size(pivot_table,1) %go through the row for GC_Cong
  %GC_Cong
   pid1 = pivot_table(dd,1);
   idx1 = strcmp(proc_data.resultId, pid1{1}) & strcmp(proc_data.Congruence, 'GC_Cong');
   conditiontable1 = proc_data(idx1, :);
   gc_cong_a = mean([conditiontable1.responseTime]);
   pivot_table{dd, 2} = gc_cong_a;
end

for dd = 1:size(pivot_table,1) %go through the row for GC_Incong
  %GC_Incong
   pid1 = pivot_table(dd,1);
   idx1 = strcmp(proc_data.resultId, pid1{1}) & strcmp(proc_data.Congruence, 'GC_Incong');
   conditiontable1 = proc_data(idx1, :);
   gc_incong_a = mean([conditiontable1.responseTime]);
   pivot_table{dd, 3} = gc_incong_a;
end

for dd = 1:size(pivot_table,1) %go through the row for CN_Cong
  %CN_Cong
   pid1 = pivot_table(dd,1);
   idx1 = strcmp(proc_data.resultId, pid1{1}) & strcmp(proc_data.Congruence, 'CN_Cong');
   conditiontable1 = proc_data(idx1, :);
   CN_cong_a = mean([conditiontable1.responseTime]);
   pivot_table{dd, 4} = CN_cong_a;
end

for dd = 1:size(pivot_table,1) %go through the row for CN_Incong
  %CN_Incong
   pid1 = pivot_table(dd,1);
   idx1 = strcmp(proc_data.resultId, pid1{1}) & strcmp(proc_data.Congruence, 'CN_Incong');
   conditiontable1 = proc_data(idx1, :);
   cn_incong_a = mean([conditiontable1.responseTime]);
   pivot_table{dd, 5} = cn_incong_a;
end