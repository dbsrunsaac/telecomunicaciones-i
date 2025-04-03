clear, clc, close all;

% Usar el paquete simbólico
syms x;
R = 50;
f = exp(-5*x); % Ejemplo: e^(-x)

% Calcular la integral definida de 0 a infinito
resultado = (1/R)*int(f^2, x, 0, Inf);
resultado = double(resultado);

% Mostrar el resultado
disp(['Energía Total: ', num2str(resultado), 'J']);

% Analizando la respuesta del sistema
fw = 1/sqrt(x^2 + 25);

energia_salida = (1/(2*pi*R))*int(fw^2, x, -5, 5);
energia_salida = double(energia_salida);

disp(['Energía en la salida del sistema: ', num2str(energia_salida), 'J']);

% Graficar la señal
% Parámetros
t = -6:0.01:6; % Intervalo de tiempo (de -10 a 10 segundos con paso de 0.01)
amplitud = 1;    % Amplitud de la señal rectangular

% Generar la señal rectangular
y = amplitud * ((t >= -5) & (t <= 5)); % Amplitud 1 entre -5 y 5, 0 fuera de este rango

% Graficar la señal
figure;
plot(t, y, 'b', 'LineWidth', 1.5);
grid on;
title('Señal Rectangular');
xlabel('Tiempo (s)');
ylabel('Amplitud');
xlim([-6, 6]);
ylim([0, 1.5]); % Ajuste del rango del eje y para visualizar correctamente




% Gráficando la señales
figure;
subplot(2, 1, 1);
fplot(f, [0, 1]);
title('Señal de entrada en el tiempo');
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');

subplot(2, 1, 2);
fplot(fw, [0, 5]);
title('Señal de entrada en frecuencia');
xlabel('Frecuencia angular W (rads/s)');
ylabel('Voltaje (V)');




