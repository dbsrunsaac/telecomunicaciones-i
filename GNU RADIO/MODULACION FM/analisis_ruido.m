clc, clear, close all;
% Ruta de la carpeta (puedes cambiarla por la que necesites)
% carpeta = 'C:\Users\Bremdows\UNSAAC\SEMESTRE VII\TELECOMUNICACIONES I\telecomunicaciones-i\GNU RADIO\MODULACION FM\data';
carpeta = './data';
% Obtener lista de archivos (excluye carpetas)
archivos = dir(fullfile(carpeta, '*'));
archivos = archivos(~[archivos.isdir]);  % Filtrar solo archivos
distancia = [0, 10, 20, 30, 40, 50, 100, 150, 200, 250];

% Mostrar los nombres de archivo
% length(archivos)

media = [];
i = 1;
for k = 14: 23 
    disp(archivos(k).name);
    data = readmatrix(strcat("./data/", archivos(k).name));
    freq = data(1:401, 1);
    pot = data(1:401, 2);
    
    plot(freq, pot);
    hold on
    title("Frecuencia - Potencia");
    xlabel("Frecuencia M [Hz]");
    ylabel("Potencia [dBm]");
    media(i) = mean(pot);
    i = i + 1;
end
hold off

figure
plot(distancia, media);

disp(length(media));