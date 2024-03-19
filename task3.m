%% produce a descriptive statistics table
data = readtable('pivot_table.csv');% Load pivot table data 


condition_data = data{:, {'GC_Cong', 'GC_Incong', 'CN_Cong', 'CN_Incong'}};% Select condition variables

% Calculate descriptive statistics for each condition column
mean_data = mean(condition_data);
median_data = median(condition_data);
std_data = std(condition_data);
min_data = min(condition_data);
max_data = max(condition_data);

% Combine measures into one statistics table
descriptive_table = table(mean_data', median_data', std_data', min_data', max_data', 'VariableNames', {'Mean', 'Median', 'StdDev', 'Min', 'Max'},'RowNames', {'GC_Cong', 'GC_Incong', 'CN_Cong', 'CN_Incong'});

% Display descriptive statistics table
disp(descriptive_table);


%% perform a Repeated-Meaures ANOVA

data = readtable('pivot_table.csv'); % Load  data

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

%% Check if ANOVA result is significant
if p < 0.05
    % Conduct Tukey's Honestly Significant Difference (HSD) test for post hoc analysis
    comparison = multcompare(stats);
    
    % Display post hoc comparison results
    disp(comparison);
else
    disp('No significant differences found.');
end


%% Produce log-transformed graph with average response times between conditions
data = readtable ('pivot_table.csv'); %load data

    CN_Cong_rt = data.CN_Cong; % Response times for congruent condition in CN task
    CN_InCong_rt= data.CN_Incong; % Response times for incongruent condition in CN task
    GC_Cong_rt = data.GC_Cong;  % Response times for congruent condition in GC task
    GC_InCong_rt = data.GC_Incong;  % Response times for incongruent condition in GC task

%plot line graph 
figure; 
    plot (CN_Cong_rt, 'b-', 'DisplayName','Color Naming Congruent');
    hold on; 
    plot (CN_InCong_rt, 'b--', 'DisplayName', 'Color Naming Incongruent');
    plot (GC_Cong_rt, 'r-', 'DisplayName', 'Gender-catergorization Congruent');
    plot (GC_InCong_rt, 'r--', 'DisplayName','Gender-catergorization Incongruent');
        xlabel('Particiapnt');
        ylabel('Log-Transformed Response Time');
        title ('Log-Transformed Response Time for Congruent and Incongruent Conditions');
        legend ('Location', 'best')
        grid on;
%% Create box plot comparing average response times between conditions 
data = readtable ('pivot_table.csv');
%identify condition columns 
response_times = [data.CN_Cong, data.CN_Incong, data.GC_Cong, data.GC_Incong];

%create boxplot
figure;
boxplot(response_times, 'Labels', {'CN Congruent', 'CN Incongruent', 'GC Congruent', 'GC Incongruent'});
xlabel ('Task and Condition');
ylabel ('Response Time');
title ('Box Plot of Reponse Times for Different Tasks and Conditions')

