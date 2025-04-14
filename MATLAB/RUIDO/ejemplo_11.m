clc; clear; close all;

t = 0:0.001:10;
x = square(t)';  % Convertir a columna para `filter`

% Crear canal Rayleigh
rayleigh = comm.RayleighChannel( ...
    'SampleRate', 1000, ...
    'MaximumDopplerShift', 20);

% Pasar la señal por el canal
y = rayleigh(x);

% Graficar magnitud y fase
subplot(2,1,1)
plot(abs(y));
title('Amplitud');

subplot(2,1,2)
plot(unwrap(angle(y)));
title('Fase');
