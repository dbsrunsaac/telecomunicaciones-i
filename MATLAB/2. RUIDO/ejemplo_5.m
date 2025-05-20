clc, clear, close all;
% Filtro Butterworth con 'buttord' y 'butter'
w_paso = 5*pi*1000;
w_rechazo = 25*pi*1000;
aten_paso = 2;
aten_rechazo = 30;

[n,w_corte] = buttord(w_paso,w_rechazo,aten_paso,aten_rechazo,'s');
% ¿'s'? ver help buttord
[Y,X] = butter(n,w_corte,'s');
b = tf(Y,X);
ltiview(b)
