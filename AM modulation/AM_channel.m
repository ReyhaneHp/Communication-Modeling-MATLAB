clc;clear all ; close all 
%%
[input1,Fs] = audioread('m2.wav');
x = input1;
% x = load('input8000.mat');
% x = x.input1';
fc= 50 ;
plot(x)
%% am
Fs = 8000;
fc= (Fs/2)-10 ;
% modulator
Y1 = am_modulator(x,fc,Fs);
figure;subplot 121; plot(Y1)
% awgn channel 
SNR=100 ; %EsNo
y1=awgn(Y1,SNR);
%demodulator
x2 = am_demodulator(y1,fc,Fs);
subplot 122; plot(x2)
%%
audiowrite('am_d2.wav',x2,Fs);
