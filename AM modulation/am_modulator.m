function Y = am_modulator(x,Fc,Fs)
t = 0:1/Fs:length(x)*1/Fs;
y = x.*cos(2*pi*Fc*t(1:end-1));
Y=y;
end

