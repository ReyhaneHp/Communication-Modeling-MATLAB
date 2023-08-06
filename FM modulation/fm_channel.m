clc;clear all ; close all 
%%
%[input1,Fs] = audioread('m2.wav');
%x = input1;
 x = load('input8000.mat');
 x = x.input1';
fc= 50 ;
plot(x),title('orginal sound')
%% fm
Fs = 8000;
fc= (Fs/2)-100 ;
% modulator
Y1 = fm_modulator(x,fc,Fs);
%Y1 = modulate(x,fc,Fs,'fm');
figure;subplot 121; plot(Y1),title('signal after modulator')
% awgn channel 
SNR=100 ; %EsNo
y1=awgn(Y1,SNR);
%demodulator
x2 = demod(y1,fc,Fs,'fm');
%x2 = fm_demodulator(y1,fc,Fs);
subplot 122; plot(x2),title('signal after demodulator')
%%
audiowrite('am_d2_snr100.wav',x2,Fs);
