clear, clc, close all;

%% Cargar el archivo de datos
y = audioread("audio.wav");
y = y(8000:12000);
%% Parámetros de la senal de informacion
fm = 15;
a = 2;

%%  Parametro de la portadora
fc = 100;
A = 5;

Ts = 1/(1000*fc);
Fs = 1/Ts;
t = 0: Ts : 0.5 - Ts;

% ft = a*sin(2*pi*fm*t);
ft = y;

%% Modulación AM
fi = A*cos(2*pi*fc*t + 2*pi*cumsum(ft)*Ts);

%% Demodulación FM
ftq = hilbert(fi).*exp(-j*2*pi*fc*t); % Señal en cuadratura
% diff es para realizar una derivada
% unwrap es para evitar los saltos

disp(ftq(1:2));
disp((1/(2*pi))*diff(unwrap(angle(ftq(1:3))))*Fs);

dftq = [ftq(1) (1/(2*pi))*diff(unwrap(angle(ftq(1:49999))))*Fs];

%% Gráfico en el tiempo
figure
subplot(2, 1, 1);
% plot(t, fi);
hold on
plot(t(8000:12000), ft);
title("Señal FM - Modulada");
xlabel("Tiempo [s]");
ylabel("Amplitud");
xlim([min(t) max(t)]);
grid on

subplot(2, 1, 2);
plot(t(1:49999), dftq);
hold on
plot(t(8000:12000), ft);
title("Señal FM - Demodulada");
xlabel("Tiempo [s]");
ylabel("Amplitud");
xlim([min(t) max(t)]);
ylim([-5 5]);
grid on
% legend(["Señal demodulada", "Señal de información"]);

