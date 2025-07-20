clc, clear, close all;
% 
data = readmatrix("data/PR.csv");
freq = data(1:401, 1);
pot = data(1:401, 2);

media = mean(pot);
disp(["media:", media]);


plot(freq, pot);
