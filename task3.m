

data = readtable ('pivot_table.csv');
within_subjects = {'GC_Cong', 'GC_Incong', 'CN_Cong', 'CN_Incong'};
rm = fitrm(data, 'GC_Cong, GC_Incong, CN_Cong, CN_Incong ~ 1', 'WithinDesign', within_subjects);
ranovaResults = ranova(rm);
disp(ranovaResults);
