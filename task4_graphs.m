
subplot(1,3,1)
histogram(proc_data.responseTime)
xlabel('Respone Time');   		% x label
ylabel('Frequency');   		% y label
title('Histogram of Response Times for Participants');	% title


subplot(1,3,2)
histogram(proc_data.LogRT)
xlabel('Log Transformed Respone Times');   		% x label
ylabel('Frequency');   		% y label
title('Histogram of LogRT for Participants');	% title

subplot(1,3,3)
plot(proc_data.LogRT,proc_data)