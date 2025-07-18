clc, clear, close all;

% Ruta de la carpeta (puedes cambiarla por la que necesites)
carpeta = 'C:\Users\Bremdows\UNSAAC\SEMESTRE VII\TELECOMUNICACIONES I\telecomunicaciones-i\GNU RADIO\MODULACION FM\data';

% Obtener lista de archivos (excluye carpetas)
archivos = dir(fullfile(carpeta, '*'));
archivos = archivos(~[archivos.isdir]);  % Filtrar solo archivos

% Mostrar los nombres de archivo
for k = 1:length(archivos)
    
end
