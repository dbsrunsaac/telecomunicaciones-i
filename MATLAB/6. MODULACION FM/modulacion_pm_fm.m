clc, clear, close all;

%% GENERACION DE LAS SEÑALES
clc; clear; close all;

f = 0.25;               % Frecuencia de la señal (Hz)
T = 1/f;             % Periodo
Fs = 1000;           % Frecuencia de muestreo
Ts = 1/Fs;
t = 0: Ts : 10*T;      % Vector de tiempo para dos periodos


% SENAL CUADRADA
ft1 = square(2*pi*f*t);

% SENAL TRIANGULAR
ft2 = 1 + sawtooth(2*pi*f*t, 0.5);  % Ciclo de subida y bajada simetrico


%% MODULACION PM Y FM

% PORTADORA
A = 1;
fc = 100;
kp = 15;

% SENAL PM
fi1 = A*sin( 2*pi*fc*t + kp*ft1);
fi2 = A*sin( 2*pi*fc*t + kp*ft2);

% SENAL FM
fi3 = A*sin( 2*pi*fc*t + cumsum(ft1));
fi4 = A*sin( 2*pi*fc*t + cumsum(ft2));

%% GRAFICAS Y RESULTADOS
figure;
subplot(1, 2, 1);
plot(t, ft1);
title("Señal Cuadrada");

subplot(1, 2, 2);
plot(t, ft2);
title("Señal Triangular");

figure;
subplot(2,2,1);
plot(t, fi1);
title('Señal Cuadrada');
xlabel('Tiempo [s]');
ylabel('Amplitud');
ylim([-2 2]);
grid on;
hold off;

subplot(2,2,2);
plot(t, fi2);
title('Señal Triangular');
xlabel('Tiempo [s]');
ylabel('Amplitud');
ylim([-2 2]);
grid on;
hold off;

subplot(2, 2, 3);
plot(t, fi3);
title('Señal Cuadrada');
xlabel('Tiempo [s]');
ylabel('Amplitud');
ylim([-2 2]);
grid on;
hold off;

subplot(2, 2, 4);
plot(t, fi4);
title('Señal Triangular');
xlabel('Tiempo [s]');
ylabel('Amplitud');
ylim([-2 2]);
grid on;
hold off;


%% VARIABLES ADICIONALES PARA SIMULINK

kf = 100;
kp = 100;
fc = 500;
