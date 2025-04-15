clc, clear, close all;
% Ejemplo de definición de un LTI (Amplificador ideal de ganancia 1/3)
X = 3
Y = 1
lt1 = tf(Y, X)           % tf define un sistema LTI

step(lt1)                % representar respuesta a escalón
pause                    % esperar tecla
impulse(lt1)             % representar respuesta impulsiva
pause
freqresp(lt1,1)          % respuesta en frecuencia = 1 rad.
pause
bode(lt1)
    