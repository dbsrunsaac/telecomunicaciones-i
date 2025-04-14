clc, clear, close all;

t = 0:0.001: 10;
x = square(t);

% Crear un objeto canal que sigue un modelo de Rayleigh
%frec. de muestreo: 1KHz, Máximo desplazamiento Doppler: 20Hz
c = rayleighchan(1/1000, 20);

% ver las propiedades del canal
c 
% La señal x atraviesa el canal c
y = filter(c, x);
% y es complejo
plot(abs(y));
plot(unwrap(angle(y)));
