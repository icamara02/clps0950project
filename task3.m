%% Make sure to have run task1 and task2 before running this script

%% produce a descriptive statistics table
while true 
    descriptives_prompt = 'Do you want to see a descriptives table? (yes/no):';
    str = input (descriptives_prompt, 's');
    %user input
     if strcmpi(str, 'yes')
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
        break; %stop loop
    
     elseif strcmpi (str, 'no')
             disp ('Descriptive table not requested.');
             break; 
     else 
         disp ('Invalid input. Please enter "yes" or "no".');
     end 
end 
 
%% perform a Repeated-Meaures ANOVA
while true 
    descriptives_prompt = 'Do you want to perform a repeated-measure ANOVA? (yes/no):';
    str = input (descriptives_prompt, 's');
    %user input
     if strcmpi(str, 'yes')
        data = readtable('pivot_table.csv'); % Load  data
        
        within_subjects_factors = {'GC_Cong', 'GC_Incong', 'CN_Cong', 'CN_Incong'};% Define within-subjects factors (conditions)
        
        rm = fitrm(data, 'GC_Cong-CN_Incong~1', 'WithinDesign', within_subjects_factors);% Create a repeated measures model
        
        ranova_results = ranova(rm); % Perform repeated measures ANOVA
        disp (ranova_results);
        break; %stop loop
    
     elseif strcmpi (str, 'no')
             disp ('Repeated-measures ANOVA not requested.');
             break; 
     else 
         disp ('Invalid input. Please enter "yes" or "no".'); %if user responds with anything besides yes or no 
     end 
end 
     
%% perform a One-way ANOVA
while true 
    descriptives_prompt = 'Do you want to perform a one-way ANOVA? (yes/no):';
    str = input (descriptives_prompt, 's');
    %user input
     if strcmpi(str, 'yes')
        data = readtable('pivot_table.csv'); %load data from the pivot table with average response times
        
        conditions = {'GC_Cong', 'GC_Incong', 'CN_Cong', 'CN_Incong'};%define the four conditions
        
        response_times = data{:, conditions}; % Extract response times for each condition
        
        [p, tbl, stats] = anova1(response_times);% Perform one-way ANOVA
        
        disp(tbl);% Display ANOVA table
        disp(stats);% Display ANOVA statistics
        disp(['p-value: ', num2str(p)]);% Display p-value
        break; %stop loop
     elseif strcmpi (str, 'no')
             disp ('One-way ANOVA not requested.');
             break; 
     else 
         disp ('Invalid input. Please enter "yes" or "no".');
     end 
end 


%% Produce log-transformed graph with average response times between conditions
while true 
  descriptives_prompt = 'Do you want to produce a graph with average response time between conditions? (yes/no):';
  str = input (descriptives_prompt, 's');
  %user input
  if strcmpi(str, 'yes')
    data = readtable ('pivot_table.csv'); %load data
        
            CN_Cong_rt = data.CN_Cong; % Response times for congruent condition in CN task
            CN_InCong_rt= data.CN_Incong; % Response times for incongruent condition in CN task
            GC_Cong_rt = data.GC_Cong;  % Response times for congruent condition in GC task
            GC_InCong_rt = data.GC_Incong;  % Response times for incongruent condition in GC task
        
        %plot line graph and add labels to the figure 
        figure; 
            plot (CN_Cong_rt, 'b-', 'DisplayName','Color Naming Congruent'); %blue solid line for color naming congruent 
            hold on; 
            plot (CN_InCong_rt, 'b--', 'DisplayName', 'Color Naming Incongruent'); %blue dotted line for color namign incongruent
            plot (GC_Cong_rt, 'r-', 'DisplayName', 'Gender-catergorization Congruent'); %red solid line for gender-catergorization congruent
            plot (GC_InCong_rt, 'r--', 'DisplayName','Gender-catergorization Incongruent'); %blue solid line for gender-catergorization incongurent 
                xlabel('Participant');
                ylabel('Log-Transformed Response Time');
                title ('Log-Transformed Response Time for Congruent and Incongruent Conditions');
                legend ('Location', 'best')
                grid on;
  break; %stop loop
     else if strcmpi (str, 'no')
             disp ('Graph not requested.');
             break; 
     else 
         disp ('Invalid input. Please enter "yes" or "no".');
     end 
     end 
end 
%% Create box plot comparing average response times between conditions 
while true 
    boxplot_prompt= 'Do you want to see a box plot? (yes/no)'; %ask user if they want a boxplot 
    str = input (boxplot_prompt, 's');
    if strcmpi (str, 'yes') %check for input "yes"
        data = readtable ('pivot_table.csv');
        %identify condition columns 
        response_times = [data.CN_Cong, data.CN_Incong, data.GC_Cong, data.GC_Incong];
        
        %create boxplot
        figure;
            boxplot(response_times, 'Labels', {'CN Congruent', 'CN Incongruent', 'GC Congruent', 'GC Incongruent'});
            xlabel ('Task and Condition');
            ylabel ('Response Time');
            title ('Box Plot of Reponse Times for Different Tasks and Conditions')
    
        break; 
    elseif strcmpi (str, 'no') %if user responds no, display message saying that plot wasn't requested
         disp ('Box plot not requested.');
         break; 
    else 
        disp ('Invalid input. Please enter "yes" or "no".');
    end 
end  
%% Create a histogram of response times
while true 
    boxplot_prompt= 'Do you want to see a histogram of response times? (yes/no)'; %ask user if they want a boxplot 
    str = input (boxplot_prompt, 's');
    if strcmpi (str, 'yes') %check for input "yes"
    figure;
    histogram(proc_data.responseTime)
    xlabel('Respone Time');   		% x label
    ylabel('Frequency');   		% y label
    title('Histogram of Response Time for Participants');	% title
    break; %stop loop
    else if strcmpi (str, 'no')
             disp ('Graph not requested.');
             break; 
     else 
         disp ('Invalid input. Please enter "yes" or "no".');
     end 
     end 
end 

%% Create a histogram of log-transformed response times
while true 
    boxplot_prompt= 'Do you want to see a histogram of log-transformed response times? (yes/no)'; %ask user if they want a boxplot 
    str = input (boxplot_prompt, 's');
    if strcmpi (str, 'yes') %check for input "yes"
    figure;
    histogram(proc_data.LogRT)
    xlabel('Log Transformed Respone Times');   		% x label
    ylabel('Frequency');   		% y label
    title('Histogram of LogRT for Participants');	% title
    break; %stop loop
    else if strcmpi (str, 'no')
             disp ('Graph not requested.');
             break; 
     else 
         disp ('Invalid input. Please enter "yes" or "no".');
     end 
     end 
end 
