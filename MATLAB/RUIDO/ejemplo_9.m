clc, clear, close all;
% Añadir ruido WGN a una señal cuadrada con SNR=15dB
t = 0:0.01:10;
g = square(t);            % señal cuadrada
g_ruido = awgn(g,15);     % añadir ruido, SNR = 15dB
plot(t, g_ruido)          % representar señal con ruido

% Representar las densidades espectrales de potencia
psd(g)
hold on
psd(g_ruido)
