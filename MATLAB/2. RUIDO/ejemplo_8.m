clc, clear, close all;
% Vector de ruido de 1000 elementos, 0.5W de potencia sobre una carga de
% 100Ohm
ruido = wgn(1000,1, 0.5, 100);
plot(ruido);