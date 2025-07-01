clc, clear, close all;

%% Variables globales 
Fs = 100000;
t = 0: 1/Fs: 0.5*10^-2; % Determina la cantidad de puntos

%% Senal de informacion;
a = 2;
fm = 500;
ft = a*sin(2*pi*fm*t);

%% Senal Fm modulada
A = 5;
fc = 4000;
fdev = 1000;
% fi = A*fmmod(ft, fc, Fs, fdev, 0);

fi = A*sin(2*pi*fc*t + a*cos(2*pi*fm*t));

%% Dominio del tiempo

figure
subplot(2,1,1);
plot(t, ft);
hold on
plot(t, fi);
title("Señal modulada en el tiempo");
hold off

%% Dominio de la Frecuencia
N = length(t);
FI = fftshift(fft(fi));

% f = fs*(0:N-1)/N;
f = linspace(-Fs/2, Fs/2, N);

subplot(2, 1, 2);
stem(f, abs(FI/N));
title("Señal expresada en el dominio de la frecuencia");

%% Análisis en frecuencia - Bessel


fc = fc/1000;
fm = fm/1000;

Ffm(1) = 0;
y(1) = 0;
figure
j = 1;

for i = -3 : 3
    Ffm(j) = A*besselj(i,a);
    if( i < 0)
        y(j) = fc + i*fm;
    elseif(i == 0)
        y(j) = fc;
    else
        y(j) = fc + i*fm;
    end
    j = j + 1;
end

stem(y, abs(Ffm));
title("Señal FM - Frecuencia");
xlabel("Frecuencia [K Hz]");
ylabel("Amplitud");
xlim([1.5, 6.5]);