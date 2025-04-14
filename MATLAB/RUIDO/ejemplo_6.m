clc, clear, close all;
% Añadir ruido a una sinusoide usando números aleatorios (randn - distrib. normal)
randn('state',0);
t = 0:0.001:pi;
g = sin(2*pi*2*t);
g_ruido = g + 0.25*randn(1,size(t));   % sumar vector aleatorio

subplot(211)
plot(t,g)
subplot(212)
plot(t,g_ruido)
