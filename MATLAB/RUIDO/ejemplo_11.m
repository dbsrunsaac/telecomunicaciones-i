clc; clear; close all;

t = 0:0.001:10;
x = square(t)';  % Convertir a columna para `filter`

% Crear canal Rayleigh
rayleigh = comm.RayleighChannel( ...
    'SampleRate', 1000, ...
    'MaximumDopplerShift', 20);
figure;
plot(t, x);
title('Señal cuadrada de entrada');
xlabel('Tiempo [s]');
ylabel('Amplitud');
% Pasar la señal por el canal
y = rayleigh(x);

% Graficar magnitud y fase
figure;
subplot(2,1,1)
plot(t, abs(y));
title('Amplitud');

subplot(2,1,2)
plot(t, unwrap(angle(y)));
title('Fase');
