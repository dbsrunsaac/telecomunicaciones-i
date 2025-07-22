clc, clear, close all;
% Ruta de la carpeta (puedes cambiarla por la que necesites)
% carpeta = 'C:\Users\Bremdows\UNSAAC\SEMESTRE VII\TELECOMUNICACIONES I\telecomunicaciones-i\GNU RADIO\MODULACION FM\data';
carpeta = './data2/';
% Obtener lista de archivos (excluye carpetas)
archivos = dir(fullfile(carpeta, '*'));
archivos = archivos(~[archivos.isdir]);  % Filtrar solo archivos
distancias = [0, 10, 20, 30, 40, 50, 100, 150, 200, 250];

% Mostrar los nombres de archivo
% length(archivos)

media = [];

l = 1;
for k = 1: 10
%     disp(archivos(k).name);
    data = readmatrix(strcat(carpeta, archivos(k).name));
    
    freq_discriminador = [];
    pot_discriminador = [];
    j = 1;
    for i = 1 : 401
        if (data(i, 2) >= - 110)
            freq_discriminador(j) = data(i,1);
            pot_discriminador(j) = data(i, 2);
            j = j + 1;
        end
    end
    
    media(l) = mean(pot_discriminador);
    disp(["Media para ", archivos(k).name, " es: ", media(l)])
    % Calculo de la media general
    l = l + 1;
end

hold on
title("Frecuencia - Potencia");
xlabel("Frecuencia M [Hz]");
ylabel("Potencia [dBm]");
hold off

disp([length(freq_discriminador), length(pot_discriminador)]);
plot(freq_discriminador, pot_discriminador);

media_disc = mean(pot_discriminador);

disp(media_disc);

figure
plot(distancias, media);
disp(length(distancias));
disp(length(media));