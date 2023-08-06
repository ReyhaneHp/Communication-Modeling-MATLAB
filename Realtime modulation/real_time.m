clc; clear all ; close all 
%% Record voice 
Fs= 8000;
fc= (Fs/2)-100 ;
%recorder = audiorecorder(Fs,nBits,nChannels)
recObj  = audiorecorder(Fs,16,1);
get(recObj);
% Record your voice for 5 seconds.
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 5);
disp('End of Recording.');
% Play back the recording.
play(recObj);
% Store data in double-precision array.
myRecording = getaudiodata(recObj);
% Plot the waveform.
plot(myRecording);
x= myRecording';
%audiowrite('org.wav',x,Fs);

%% AM_modulation
% modulator
Y1 = am_modulator(x,fc,Fs);
figure;subplot 121; plot(Y1)
% awgn channel 
SNR=60 ; %EsNo
y1=awgn(Y1,SNR);
%demodulator
x2 = am_demodulator(y1,fc,Fs);
subplot 122; plot(x2)
%%
sound(x2)
%audiowrite('am_d2.wav',x2,Fs);

%% FM_modulation 
% modulator
Y11 = fm_modulator(x,fc,Fs);
%Y1 = modulate(x,fc,Fs,'fm');
figure;subplot 121; plot(Y11),title('signal after modulator')
% awgn channel 
y11=awgn(Y11,SNR);
%demodulator
x22 = demod(y11,fc,Fs,'fm');
%x2 = fm_demodulator(y1,fc,Fs);
subplot 122; plot(x22),title('signal after demodulator')
%% 
sound(x22)
%audiowrite('fm_d2.wav',x22,Fs);
