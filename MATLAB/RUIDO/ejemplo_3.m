clc, clear, close all;
% filtro RC 1er orden
R = 10e3;
C = 10e-12;
Y = 1;
X = [R*C 1];
filtroRC = tf(Y, X);
step(filtroRC);
impulse(filtroRC);
ltiview(filtroRC);