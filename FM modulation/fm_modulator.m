function Y = fm_modulator(x,fc,Fs)

t = 0:1/Fs:(length(x)/Fs);
opt = (fc/Fs)*2*pi/(max(max(x)));
Y = cos(2*pi*fc*t(1:end-1) + opt*cumsum(x));

end


