% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal Nomor 6 — Optimasi Profit Tim Pricing
%  --------------------------------------------------- 
%  Nama  : Muhammad Arkan Ryanto
%  NIM   : 2510514017
%  Parameter: N=17, a=1, b=7, K=9, theta0=65, alpha=0.008 
%  Tanggal: 27 April 2026
% ===================================================== 
  
clc; clear; close all; 
  
N = 17;       
a = 1;         
b = 7;         
K = 9;         
alpha_lr = 0.008;
x0 = 1;       

fprintf('===============================\n');
fprintf('Jawaban soal 6.1: Analitik\n');

% Model Profit: pi(x) = -(a+1)x^3 + (b+5)Kx^2 + 100x - (K^2 * 10)
% Substitusi: pi(x) = -2x^3 + 108x^2 + 100x - 810
f_profit = @(x) -(a+1)*x.^3 + (b+5)*K*x.^2 + 100*x - (K^2 * 10);
% Turunan: pi'(x) = -6x^2 + 216x + 100
f_gradien = @(x) -3*(a+1)*x.^2 + 2*(b+5)*K*x + 100;

% Menghitung akar turunan dengan rumus ABC
A = -3*(a+1); 
B = 2*(b+5)*K; 
C = 100;
D = sqrt(B^2 - 4*A*C);
x_star = (-B - D) / (2*A);

fprintf('Model: pi(x) = -2x^3 + 108x^2 + 100x - 810\n');
fprintf('Titik Optimal x* : %.6f\n', x_star);
fprintf('Profit Maksimum  : %.6f\n\n', f_profit(x_star));


% ; Jawaban Bagian 6.2 
fprintf('===============================\n');
fprintf('Jawaban soal 6.2: Numerik\n');

fprintf('k \t x_k \t\t pi(x_k) \t pi''(x_k) \t x_{k+1}\n');
fprintf('------------------------------------------------------------\n');

iterasi = 500;
x_hist = zeros(iterasi+1, 1);
x_hist(1) = x0;
x_curr = x0;

for k = 1:iterasi
    grad = f_gradien(x_curr);
    prof = f_profit(x_curr);
    x_next = x_curr + alpha_lr * grad;
    
    if k <= 5
        fprintf('%d \t %.6f \t %.6f \t %.6f \t %.6f\n', k-1, x_curr, prof, grad, x_next);
    end
    
    x_curr = x_next;
    x_hist(k+1) = x_curr;
end

fprintf('------------------------------------------------------------\n');
fprintf('Hasil Numerik x setelah %d iterasi: %.6f\n\n', iterasi, x_curr);

figure; 
fplot(f_profit, [0 60], 'LineWidth', 2); hold on;
plot(x_hist(1:100), f_profit(x_hist(1:100)), 'ro-', 'MarkerSize', 3, 'MarkerFaceColor', 'r');
grid on;
title('Visualisasi Gradient Descent');
xlabel('Harga Produk (x dalam ribuan)');
ylabel('Profit (\pi dalam ribuan)');
legend('Fungsi Profit', 'Lintasan Iterasi');
% Simpan gambar
saveas(gcf, 'Grafik_Optimasi_Default.png');
fprintf('\nGrafik berhasil disimpan: Grafik_Optimasi_6_17.png\n');

% Jawaban Bagian 6.3
fprintf('===============================\n');
fprintf('Jawaban soal 6.3\n');

harga_rp = x_star * 1000;
profit_rp = f_profit(x_star) * 1000;
biaya_rp = (K * 10) * 1000;
margin_rp = harga_rp - biaya_rp;

fprintf('Harga Jual Optimal : Rp %.2f\n', harga_rp);
fprintf('Total Profit Maks  : Rp %.2f\n', profit_rp);
fprintf('Biaya per Unit     : Rp %.2f\n', biaya_rp);
fprintf('Margin per Unit    : Rp %.2f\n', margin_rp);
fprintf('===============================\n');