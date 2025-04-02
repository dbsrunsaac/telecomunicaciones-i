R = 50;
t = 0:0.001:1;
f_t = exp(-5*t);


E_tiempo = (1/R) * trapz(t, f_t.^2);

E_analitica = (1/10*R);

disp(["Energía calculada númerica:", num2str(E_tiempo), 'J']);
disp(["Energía teórica (analitica):", num2str(E_analitica), 'J']);


figure;
subplot(2, 1, 1);
plot(t, f_t, 'LineWidth', 2);
title('Señal f(t) = e^(-5t)');

xlabel('Tiempo (s)');
ylabel('Voltaje (v)');
grid on

subplot(2, 1, 2);
energia_acumulada = (1/R)*cumtrapz(t, f_t.^2);
plot(t, energia_acumulada, 'r', 'LineWidth', 2);
title('Energía acumulada');
xlabel('Tiempo (s)');
ylabel('Energia (J)');


% Calculo de la energía a la salida del sistema
% Tratamiento en frecuencia
fs = 1000;
w = 0:0.001:1;
fw = fft(f_t);


Eo = (1/(2*pi*10*R))*trapz(t,abs(fw).^2);
figure;
plot(w, Eo);



