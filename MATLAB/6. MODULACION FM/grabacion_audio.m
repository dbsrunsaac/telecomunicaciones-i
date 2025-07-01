clc, clear, close all;

% Objeto audio para la grabacion
% recObj = audiorecorder;

% Iniciar con la grabacion
% recordblocking(recObj, 2);
% y = getaudiodata(recObj); % Obtener las muestras 
% play(recObj);

%% Guardar el archivo
% audiowrite("audio.wav", y, Fs);

%% Recuperar el archivo de datos
Fs = 8000;
[y, Fs] = audioread("audio.wav");

%% Gráficar la señal de audio

Ts = 1/Fs;
t = 0: Ts : 2 - Ts ;
plot(t, y);

%% Analisis en frecuencia
Y = fftshift(fft(y));
N = length(t);
f = Fs*(-N/2 : N/2 -1)/N;
figure
plot(f, abs(Y)/N);
title("Señal de audio en frecuencia");
xlabel("Frecuencia [Hz]");
ylabel("Amplitud");

