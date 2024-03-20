
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

