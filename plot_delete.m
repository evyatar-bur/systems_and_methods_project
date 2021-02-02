
t_02 = (0:length(ECG)-1)*T;


figure(2)
plot(t_02,ECG)
title('first ECG signal in seconds 20-25')
xlabel('Time (sec)')
ylabel('Voltage (micro-Volt)')
hold on
plot(T*R_peaks,ECG(peak_info{1,1}),'o')
hold off