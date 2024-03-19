%% perform a Repeated-Meaures ANOVA

data = readtable('pivot_table.csv'); % Load your data

within_subjects_factors = {'GC_Cong', 'GC_Incong', 'CN_Cong', 'CN_Incong'};% Define within-subjects factors (conditions)

rm = fitrm(data, 'GC_Cong-CN_Incong~1', 'WithinDesign', within_subjects_factors);% Create a repeated measures model

ranova_results = ranova(rm); % Perform repeated measures ANOVA
disp (ranova_results);
%% perform a One-way ANOVA
data = readtable('pivot_table.csv'); %load data from the pivot table with average response times

conditions = {'GC_Cong', 'GC_Incong', 'CN_Cong', 'CN_Incong'};%define the four conditions

response_times = data{:, conditions}; % Extract response times for each condition

[p, tbl, stats] = anova1(response_times);% Perform one-way ANOVA

disp(tbl);% Display ANOVA table
disp(stats);% Display ANOVA statistics
disp(['p-value: ', num2str(p)]);% Display p-value
