function [width,offset] = QRS_width(ECG,peaks,peak_index,fs)

index = peaks(peak_index);

before_window = ECG(index:-1:index-round(fs/2));
after_window = ECG(index:index+round(fs/2));


before_width = find(before_window < 0);

after_width = find(after_window < 0);

width = (before_width(1) + after_width(1))/fs;

offset = after_width(1);

end

