function [filtered_signal] = Filter_sig(signal)
% Filter_sig recieves a signal with breathing noise at 0.5 Hz frequencies,
% and network noise at the given frequency - PLFREQ - and at 2*PLFREQ.
% The function returns the filtered signal, without the noise frequencies.

% Note that this function uses filtfilt() function, in order to overcome
% group delay, by filtering the signal twice - forward and backwards.

fs = 2000;

% Filter with FIR hamming HPF to eliminate baseline wander
hd1 = HPF;
filtered_signal = filter(hd1.Numerator,1,signal);


% Filter with IIR butterworth band stop filter to eliminate breathing frequency (0.5 Hz)
hd2 = LPF;
filtered_signal = filter(hd2.Numerator,1,filtered_signal);


end

