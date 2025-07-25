clc, clear, close all;
% Ruta de la carpeta (puedes cambiarla por la que necesites)
% carpeta = 'C:\Users\Bremdows\UNSAAC\SEMESTRE VII\TELECOMUNICACIONES I\telecomunicaciones-i\GNU RADIO\MODULACION FM\data';
carpeta = './data2/';
% Obtener lista de archivos (excluye carpetas)
archivos = dir(fullfile(carpeta, '*'));
archivos = archivos(~[archivos.isdir]);  % Filtrar solo archivos

distancias = [10, 30, 50, 100, 150, 200, 250];

% Mostrar los nombres de archivo
% length(archivos)

%% Potencia media de cada archivo

media = [];
l = 1;
for k = 1: 7
%     disp(archivos(k).name);
    data = readmatrix(strcat(carpeta, archivos(k).name));
    
    plot(data(1:401, 1), data(1:401, 2));
    hold on
    title("Potencia [dBm] - Frecuencia [Hz]");
    xlabel("Frecuencia [Hz]");
    ylabel("Potencia [dBm]");
    freq_discriminador = [];
    pot_discriminador = [];
    j = 1;
    for i = 1 : 401
        if (data(i, 2) >= -112)
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
hold off

disp([length(freq_discriminador), length(pot_discriminador)]);
% plot(freq_discriminador, pot_discriminador);

media_disc = mean(media);

disp(media_disc);

%% Gráfica de la distancia respecto a la media
figure
plot(distancias, media);
title("Potencia promedio [dBm] respecto a la distancia en [cm]");
xlabel("Distancia [cm]");
ylabel("Potencia media [dBm]");

disp(length(distancias));

disp(length(media));