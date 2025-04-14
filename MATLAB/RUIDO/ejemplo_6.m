clc, clear, close all;

% Añadir ruido a una sinusoide usando números aleatorios (randn - distrib. normal)
randn('state', 0); % Establecer la semilla para la generación de números aleatorios
t = 0:0.001:pi; % Vector de tiempo de 0 a pi con incremento de 0.001
g = sin(2*pi*2*t); % Sinusoide de 2 Hz
g_ruido = g + 0.25*randn(size(t)); % Sumar vector aleatorio con distribución norma

subplot(211)
plot(t,g)
subplot(212)
plot(t,g_ruido)
