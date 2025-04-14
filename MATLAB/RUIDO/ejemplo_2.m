clc, clear, close all;
% Filtro paso de baja ideal mediante cálculo simbólico
syms t

% Dos señales sinusoides de entrada
w1 = 1000;
x1 = cos(2*pi*w1*t);
w2 = 1100;
x2 = cos(2*pi*w2*t);

% Función de transferencia del filtro (escalón en frecuencia)
syms w
w_corte = 1001*2*pi;
H_pb = heaviside(w + w_corte)- heaviside(w - w_corte);

% Calcular las salidas en frecuencia como producto de transformadas
X1 = fourier(x1);
X2 = fourier(x2);
Y1 = X1*H_pb;
Y2 = X2*H_pb;

figure;
subplot(211);
ezplot(Y1);
subplot(212);
ezplot(Y2);

% Calcular salidas en el dominio del tiempo
y1 = ifourier(Y1);
y2 = ifourier(Y2);

% Representación de las salidas respecto al tiempo
figure;
subplot(211);
ezplot(y1);
subplot(212);
ezplot(y2);
