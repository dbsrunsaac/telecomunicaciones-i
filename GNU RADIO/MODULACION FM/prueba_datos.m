clc, clear, close all;
% Ruta del archivo CSV
% archivo = 'data\PR.csv';
% 
% % Número de filas a saltar
% filas_a_omitir = 32;
% % Leer los datos a partir de la fila 33 (índice 0 en MATLAB)
% datos_completos = dlmread(archivo, ',', filas_a_omitir, 0);
% datos = datos_completos;
% 
% datos(:, 3:5) = [];
% % Mostrar los primeros datos cargados
% disp('Primeras filas leídas del archivo:');
% disp( datos(:, 2) );
% 
% media = mean(datos( :, 2) );
% disp("Media: dmB");
% disp(media);
% 
% plot(media);

fid = fopen('data\PR.csv');
linea = fgetl(fid);
valores = strsplit(linea, ',');
fclose(fid);