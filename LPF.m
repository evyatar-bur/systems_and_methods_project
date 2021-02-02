function Hd = LPF
%LPF Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.4 and Signal Processing Toolbox 8.0.
% Generated on: 28-Jan-2021 19:12:26

% FIR Window Lowpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = 2000;  % Sampling Frequency

N    = 100;      % Order
Fc   = 15;      % Cutoff Frequency
flag = 'scale';  % Sampling Flag

% Create the window vector for the design algorithm.
win = hamming(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'low', win, flag);
Hd = dfilt.dffir(b);

% [EOF]