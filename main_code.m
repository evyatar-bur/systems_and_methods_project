clear
clc

% Load ECG signal
Table = readtable('779381.csv');
array = table2array(Table);
ECG = array(:,5);
ECG = ECG(1231:end);


% Filter ECG signal and find R peaks
[R_peaks,filtered_ECG] = Rwave_detection(ECG,50); % 



















%%
%% Plots
% Add required plots
% Define time vector 
fs = 2000; 
T = 1/fs; 
t_01 = (0:length(filtered_ECG)-1)*T;


% Second plot - the given ECG signals, with markers on R waves, shown in seconds 20-25

figure(3)
plot(t_01,filtered_ECG)
title('first ECG signal in seconds 20-25')
xlabel('Time (sec)')
ylabel('Voltage (micro-Volt)')
hold on
plot(T*R_peaks,filtered_ECG(R_peaks),'o')
hold off