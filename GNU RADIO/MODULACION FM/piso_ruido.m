clc, clear, close all;

%% Media piso de ruido
pr = readmatrix("./data2/TPR");
pr_pot = pr(1:401, 2);
figure;
plot( pr(1:401, 1), pr(1:401, 2));
title("Potencia [dBm] - Frecuencia [Hz]");
xlabel("Frecuencia [Hz]");
ylabel("Potencia [dBm]");

j = 1;
freq_dis = [];
pot_dis = [];
for i = 1 : 401
    if (pr(i, 2) >= -112 && pr(i, 2) <= -109)
        freq_dis(j) = pr(i, 1);
        pot_dis(j) = pr(i, 2);
        j = j + 1;
    end
end

% Gráfica de la señal para el discriminador
figure;
plot(freq_dis, pot_dis)
title("Potencia [dBm] - Frecuencia [Hz]");
xlabel("Frecuencia [Hz]");
ylabel("Potencia [dBm]");

% Media
media_pr = mean(pr_pot);
disp(["Piso de ruido: ", media_pr]);
