clc, clear, close all;

%% CONFIGURACION INICIAL
clc; clear; close all;
fs = 100000;                 % Frecuencia de muestreo
t = 0:1/fs:0.1-1/fs;         % Vector de tiempo (100 ms)
N = length(t);               % Numero de muestras

%% PARAMETROS DE SEÑALES
% Portadora
fc = 1000;                   % Frecuencia portadora
Ac = 1;                      % Amplitud portadora

% Moduladora (mensaje)
fm = 100;                    % Frecuencia mensaje
Am = 1;                      % Amplitud mensaje
m = Am*cos(2*pi*fm*t);       % Señal moduladora

%% GENERACION DE SEÑALES
% Portadora
c = Ac*cos(2*pi*fc*t);

% DSB-SC
dsb_sc = m .* c;

% SSB (Metodo de filtrado)
filtro_pb = fir1(100, fm/fs);  % Filtro pasa bajos
hilbert_m = imag(hilbert(m));   % Transformada de Hilbert
ssb_lsb = (m.*cos(2*pi*fc*t) + (hilbert_m.*sin(2*pi*fc*t)));
ssb_lsb = filter(filtro_pb, 1, ssb_lsb); % Filtrado final

%% VISUALIZACION TIEMPO
figure('Name','Dominio Temporal','NumberTitle','off');
subplot(3,1,1);
plot(t, m, 'b', 'LineWidth', 1.5);
title('Señal Moduladora (Mensaje)');
xlabel('Tiempo (s)'); ylabel('Amplitud');
xlim([0 0.05]); grid on;

subplot(3,1,2);
plot(t, dsb_sc, 'r', 'LineWidth', 1.5);
title('Señal DSB-SC');
xlabel('Tiempo (s)'); ylabel('Amplitud');
xlim([0 0.05]); grid on;

subplot(3,1,3);
plot(t, ssb_lsb, 'm', 'LineWidth', 1.5);
title('Señal SSB (LSB)');
xlabel('Tiempo (s)'); ylabel('Amplitud');
xlim([0 0.05]); grid on;

%% ANALISIS ESPECTRAL
f = (-fs/2:fs/N:fs/2-fs/N);  % Vector de frecuencia

% Calculo de FFT
M = abs(fftshift(fft(m)/N));
DSB_SC = abs(fftshift(fft(dsb_sc)/N));
SSB_LSB = abs(fftshift(fft(ssb_lsb)/N));

% Graficas
figure('Name','Dominio Frecuencia','NumberTitle','off');
subplot(3,1,1);
plot(f, M, 'b', 'LineWidth', 1.5);
title('Espectro de la Señal Moduladora');
xlabel('Frecuencia (Hz)'); ylabel('Magnitud');
xlim([-200 200]); grid on;

subplot(3,1,2);
stem(f, DSB_SC, 'r', 'LineWidth', 1.5);
title('Espectro DSB-SC (Ancho de Banda = 2f_m)');
xlabel('Frecuencia (Hz)'); ylabel('Magnitud');
xlim([-1.5*fc 1.5*fc]); grid on;
hold on;

plot([fc+fm fc+fm], [0 max(DSB_SC)], 'k--');
plot([fc-fm fc-fm], [0 max(DSB_SC)], 'k--');
plot([-fc-fm -fc-fm], [0 max(DSB_SC)], 'k--');
plot([-fc+fm -fc+fm], [0 max(DSB_SC)], 'k--');
hold off;

subplot(3,1,3);
stem(f, SSB_LSB, 'm', 'LineWidth', 1.5);
title('Espectro SSB (Ancho de Banda = f_m)');
xlabel('Frecuencia (Hz)'); ylabel('Magnitud');
xlim([-1.5*fc 1.5*fc]); grid on;
hold on;

stem([fc-fm fc-fm], [0 max(SSB_LSB)], 'k--');
stem([-fc+fm -fc+fm], [0 max(SSB_LSB)], 'k--');
hold off;