clear, clc;

recObj = audiorecorder
recordblocking(recObj, 5);

play(recObj);


y = getaudiodata(recObj);

plot(y);

Fs = 8000;
audiowrite('grabacion.wav', y, Fs);


% Recuperar el archivo en matlab

[y, Fs] = audioread('grabacion.wav');