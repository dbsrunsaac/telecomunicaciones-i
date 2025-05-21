clc, clear, close all;
t = 0: 0.001 : 1;
g = sin(2*pi*2*t);
g_ruido = awgn(g,20);      % añadir ruido, SNR = 20 dB

subplot(311)
% Comparar señal limpia y señal con ruido
plot(t, g);

subplot(312)
plot(t, g_ruido);

subplot(313)
plot(t, g_ruido);

% Representar las densidades espectrales de potencia
pwelch(g)
hold on
pwelch(g_ruido)
