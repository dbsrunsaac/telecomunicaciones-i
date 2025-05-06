clc, clear;
%% Parámetros de la simulación
fs = 10000;         % Frecuencia de muestreo (Hz)
t = 0:1/fs:1-1/fs;  % Vector de tiempo (1 segundo)

% Parámetros de la señal portadora
fc = 1000;          % Frecuencia de la portadora (Hz)
Ac = 1;             % Amplitud de la portadora

% Parámetros de la señal moduladora
fm = 100;           % Frecuencia de la moduladora (Hz)
Am = 0.5;           % Amplitud de la moduladora
ka = 2;           % Índice de modulación (debe ser <= 1 para evitar sobremodulación)

%% Generación de señales
% Señal portadora
portadora = Ac * cos(2*pi*fc*t);

% Señal moduladora (coseno)
moduladora = Am * cos(2*pi*fm*t);

% Señal modulada AM
modulada = Ac * (1 + ka*moduladora) .* cos(2*pi*fc*t);

%% Análisis de potencia
% Determinando Vcm(t)
% Pc: Potencia portadora Pc = Ac^2/2;
% Pbl: Potencia bandas laterales
% Pcm: Potencia total
% Pbls: Potencia en la banda superior
% Pbli: Potencia en la banda inferior

% Resistencia de potencia
RL = 1;

% Arreglo con los diferentes indices de modulación
% indices = [0.3, 0.5, 0.7, 1, 1.2, 1.5, 1.8, 2];
% indices = [0.5, 1, 1.5];
indices = 0.1:0.15:5;

APc = [];
APcm = [];
APt = [];
APbl = [];
AEficiencia = [];

for i = 1 : 1: length(indices)
   
    % Potencia en la portadora
    Pc = Ac^2/(2*RL);
    % Potencia en la banda lateral inferior
    Pbli = (indices(i)*Ac/2)^2/(2*RL);

    % Potencia en la banda lateral superior
    Pbls = (indices(i)*Ac/2)^2/(2*RL);

    % Potencia Total
    Pcm = Pc + Pbli + Pbls;
    Pt = (Ac^2/2)*(1 + indices(i)^2/2);

    % Potencia en las bandas laterales
    Pbl = Pbli + Pbls; 
    
    % Eficiencia de la modulación
    eficiencia = Pbl/Pcm;
    
    APc = [APc, Pc];
    APcm = [APcm, Pcm];
    APt = [APt, Pt];
    APbl = [APbl, Pbl];
    AEficiencia = [AEficiencia, eficiencia];
    
%     mensaje_pcm = sprintf('Ka = %.2f; Potencia Modulada: %.4f W', indices(i), Pcm);
%     m_eficiencia = sprintf('Ka = %.2f; Eficiencia: %.4f W', indices(i), eficiencia);
end

figure;
subplot(221);
stem(indices, APc);
title('Potencia de la portadora');
ylabel('Potencia [W]');
xlabel('Índice de Modulación - Ka');

subplot(222);
stem(indices, APcm);
title('Potencia total');
ylabel('Potencia [W]');
xlabel('Índice de Modulación - Ka');

subplot(223);
stem(indices, APbl);
title('Potencia en las bandas laterales');
ylabel('Potencia [W]');
xlabel('Índice de Modulación - Ka');

subplot(224)
stem(indices, AEficiencia);
title('Eficiencia de la modulación');
ylabel('Eficiencia n');
xlabel('Índice de Modulación - Ka');

% figure;
% stem(indices, APt);

%% 



