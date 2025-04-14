clc, clear, close all;

% Añadir ruido WGN a una señal cuadrada con SNR=15dB
t = 0:0.01:10;
g = square(t); % Onda cuadrada de 1 Hz
g_ruido = awgn(g, 15); % Añadir ruido, SNR = 15dB

% Representar la señal con ruido
figure;
subplot(221);
plot(t, g);
title('Señal Cuadrada sin Ruido');
xlabel('Tiempo (s)');
ylabel('Amplitud');
subplot(212);
plot(t, g_ruido);
title('Señal Cuadrada con Ruido');
xlabel('Tiempo (s)');
ylabel('Amplitud');



% Representar las densidades espectrales de potencia
figure;
pwelch(g, [], [], [], 'onesided');
hold on;
pwelch(g_ruido, [], [], [], 'onesided');
title('Densidad Espectral de Potencia');
xlabel('Frecuencia (Hz)');
ylabel('Potencia/Frecuencia (dB/Hz)');
legend('Señal Original', 'Señal con Ruido');
hold off;
