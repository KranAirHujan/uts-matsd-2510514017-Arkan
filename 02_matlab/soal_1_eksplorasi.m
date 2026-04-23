% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 1 — Analisis Penjualan Toko Harian 
%  --------------------------------------------------- 
%  Nama  : Muhammad Arkan Ryanto
%  NIM   : 17
%  Parameter: N=17, a=1, b=7, K=9, theta0=65, alpha=0.008 
%  Tanggal: 23 April 2026
% ===================================================== 
  
clc; clear; close all; 
  
N = 17; a = 1; b = 7; K = 9; 
  
i = 1:7;
D = 20 + (K * i) + (mod(a * i, 7)) - (mod(b * i, 5));

mean_D   = mean(D);
median_D = median(D);
modus_D = mode(D); 
range_D  = range(D);
stdev_P  = std(D, 1); 

fprintf('Mean: %.4f\n', mean_D);
fprintf('Median: %.4f\n', median_D);
fprintf('Modus: Tidak Ada (Output MATLAB: %d)\n', modus_D);
fprintf('Range: %.4f\n', range_D);
fprintf('Standar Deviasi: %.4f\n', stdev_P);
fprintf('Waktu Eksekusi: %s\n', datestr(now, 'dd-mmm-yyyy HH:MM:SS'));

figure('Name', 'Analisis Penjualan', 'Color', 'k');
hBar = bar(i, D, 'FaceColor', [0.3 0.5 0.9]); 
hold on;

yline(mean_D, 'r--', 'LineWidth', 2, 'Label', 'Rata-rata');

xlabel('Toko Ke-i');
ylabel('Penjualan (Juta Rupiah)');
title('Diagram Batang Penjualan Per Toko');
xticks(1:7);
grid on;

saveas(gcf, 'Diagram_Penjualan_17.png');