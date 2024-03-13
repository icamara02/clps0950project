%importing file

%getting all of the participant ID's
pivot_table = unique(proc_data{:,1});


% how do i have it go through

% for dd = 1:size(C, 1) %go through the row of participants
%     for dd = 1:size(raw_data, 1) %go through the first column of the participant
%         if dd == ii & %the congruence file is equal to 'WR_CONG'
%            %add 
%     end
% end
% %at the end, take the table and export to excel

%for each participant (this part needs to go into the loop i think)
idx = strcmp(proc_data.resultId, '650352b0938c4e060cb94494') & strcmp(proc_data.Congruence, 'GC_Cong');%finds the index of every time it says that participant (cld be pp)
newtable = proc_data(idx, :); %runs through raw data and only outputs when ^ is true
average = mean([newtable.responseTime]);
%put this in the table

for dd = 1:size(pivot_table,1) %go through the row for GC_Cong
   pid = pivot_table(dd,1);
   idx = strcmp(proc_data.resultId, pid{1}); %& strcmp(raw_data.Congruence, 'GC_Cong');
   conditiontable = proc_data(idx, :);
   gc_cong_a = mean([conditiontable.responseTime]);
   pivot_table{dd, 2} = gc_cong_a;
end


   %put gc_cong_a into pivot_table




% idx1 = strcmp(newtable.Congruence, 'GC_Cong') %finds the indexes of all the gc congs
% GC_cong = newtable(idx1, :) %makes a table with all the GC_Congs
%find the average of every value in the responseTime column

