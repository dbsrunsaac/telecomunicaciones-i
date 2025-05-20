clc, clear, close all;
% Vector ruido de 1000 elementos y 2dBm de potencia
ruido = wgn(1000, 1, 2, 'dBm');
plot(ruido);