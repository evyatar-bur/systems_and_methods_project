function RR_interval = find_RR(peaks,peak_index,fs)
% This function computes the peaks RR interval

RR_interval = (peaks(peak_index) - peaks(peak_index - 1))/fs;

end

