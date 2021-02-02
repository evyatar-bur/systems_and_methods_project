%% Systems and methods project

% This script recieves an ECG signal from lead 2, and identifies which
% contractions are normal and which contractions are PVC

clear
close all
clc

% Load ECG signal from .txt file
ECG = load('PVC_sample_1.txt');

%%

% Define sample frequency 
fs = 2000;


% peak_info cell will contain the following information for each detected R peak:
% a) The peak index 
% b) RR interval - In relation to the last peak
% c) QRS width - Measured at the signal baseline
% d) ST level - The mean value of the St segment
peak_info = cell(1,4);


%% Pre-processing - Filter ECG signal and find R peaks
[peak_info{1,1},filtered_ECG] = Rwave_detection(ECG); 
 
% Pre allocating peak information vectors
peak_info{1,2} = zeros(1,length(peak_info{1,1})) ; % RR interval
peak_info{1,3} = zeros(1,length(peak_info{1,1})) ; % QRS width
peak_info{1,4} = zeros(1,length(peak_info{1,1})) ; % ST level


%% Choose first four following normal QRS complexs  

[normal_peaks,first_index] = choose_normal_QRS(filtered_ECG,peak_info{1,1},fs);


%% Calculating the relevant information for each peak 

for i = first_index:length(peak_info{1,1})
    
    % Calculate RR interval
    peak_info{1,2}(i) = find_RR(peak_info{1,1},i,fs);

    % Calculate QRS width
    [peak_info{1,3}(i),offset] = QRS_width(filtered_ECG,peak_info{1,1},i,fs);
    
    % Calculate ST level
    peak_info{1,4}(i) = st_level(filtered_ECG,peak_info{1,1},i,offset,fs);
    
end
























%% Plots
% Add required plots
% Define time vector 
fs = 2000; 
T = 1/fs; 
t_01 = (0:length(filtered_ECG)-1)*T;


% Second plot - the given ECG signals, with markers on R waves, shown in seconds 20-25

figure(1)
plot(t_01,filtered_ECG)
title('first ECG signal in seconds 20-25')
xlabel('Time (sec)')
ylabel('Voltage (micro-Volt)')
hold on
plot(T*normal_peaks,filtered_ECG(normal_peaks),'o')
hold off

