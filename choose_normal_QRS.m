function [normal_peaks,first_index] = choose_normal_QRS(filtered_ECG,r_peaks,fs)
% This function recieves the filtered ECG along with the detected peaks and
% the sample frequency, and lets the user choose manually the first four
% normal QRS complexs

% The functions outputs are the indexes of the chosen QRS complexs, and the
% smallest index, indicating where the algorithm will start running

% Define time vector
T = 1/fs; 
t_01 = (0:length(filtered_ECG)-1)*T;

% Create a plot in order to let the user choose normal QRS
figure;
plot(t_01,filtered_ECG)
title('Please choose the first 4 following normal QRS complexs')
xlabel('Time (sec)')
ylabel('Voltage (micro-Volt)')
hold on
plot(T*r_peaks,filtered_ECG(r_peaks),'o')

% Choose QRS complexs
chosen_peaks = ginput(4);

hold off

chosen_peaks = chosen_peaks(:,1)*fs;
normal_peaks = zeros(1,4);

% Move each manual choise to the exact peak index
for i = 1:4
     
    % Find the closest peak
    [~,index] = min(abs(r_peaks-chosen_peaks(i)));
    
    normal_peaks(i) = r_peaks(index);
    
end

first_index = min(normal_peaks);

end




