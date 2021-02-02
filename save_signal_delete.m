clear
clc

% Load ECG signal
Table = readtable('779381.csv'); % Insert file name here
array = table2array(Table);
ECG = array(:,5);
ECG = ECG(1231:end);

clear array Table

fid = fopen('PVC_sample_2.txt','w');

fprintf(fid,'%d\n',ECG);

fclose(fid);