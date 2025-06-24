clc, clear, close all;

%% Variables globales 
fs = 100000;
t = 0: 1/fs: 1*10^-2; % Determina la cantidad de puntos

%% Senal de informacion;
a = 2;
fm = 500;
ft = a*sin(2*pi*fm*t);

%% Senal Fm modulada
A = 5;
fc = 4000;
fdev = 1000;
fi = A*fmmod(ft, fc, fs, fdev, 0);

% fi = A*sin(2*pi*fc*t + a*cos(2*pi*fm*t));

%% Dominio del tiempo

figure
subplot(2,1,1);
plot(ft);
hold on
plot(fi);
title("Señal modulada");
hold off

%% Dominio de la Frecuencia
N = length(t);
FI = fftshift(fft(fi));
f = fs*(0:N-1)/N;

subplot(2, 1, 2);
stem(f, abs(FI/N));
title("Señal expresada en el dominio de la frecuencia");

