%importing file
raw_data = readtable ('/Users/sofiagerlein/MATLAB/clps0950project/clps0950_rawdata.xlsx')
%getting all of the participant ID's
C = unique(raw_data{:,1})
C{1,1} = 'participantid'

% how do i have it go through

for ii = 1:size(raw_data) %go through big dataset
    for pp = 1:size(C, 1)
        if pp
    end
end
%at the end, take the table and export to excel