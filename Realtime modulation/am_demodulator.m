function Y = am_demodulator(y,fc,fs)
t = 0:1/fs:length(y)*1/fs;
x = y.*cos(2*pi*fc*t(1:end-1));
[b,a] = butter(5,fc*2/fs);
x = filtfilt(b,a,x);
Y=x;
end



