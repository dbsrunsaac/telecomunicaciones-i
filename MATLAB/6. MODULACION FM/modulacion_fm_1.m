clc; clear; close all;

%% Variables
Fs = 100000;
t = 0:1/Fs:0.5e-2; % Tiempo de observación

%% Señal moduladora
a = 2;       % Índice de modulación
fm = 500;    % Frecuencia de la señal de mensaje
ft = a*sin(2*pi*fm*t); 

%% Señal FM
A = 5;
fc = 4000;   % Portadora
fi = A*sin(2*pi*fc*t + a*cos(2*pi*fm*t)); 

%% Transformada de Fourier
N = length(fi);
Fi = fftshift(fft(fi));  % fftshift para centrar la frecuencia
f = linspace(-Fs/2, Fs/2, N); % vector de frecuencias

%% Magnitud
figure;
stem(f, abs(Fi)/max(abs(Fi))); grid on;
title('Espectro de la señal FM');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud normalizada');
% xlim([fc - 5*fm, fc + 5*fm]); % Para ver las bandas laterales

beta = a;
n = 0:5;
Jn = besselj(n, beta);
disp([n.' Jn.']); % Mostrar J0, J1, ..., J5