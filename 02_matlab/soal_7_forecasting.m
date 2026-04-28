% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal  — Nomor 7 (Lengkap: Deret & Forecasting)
%  --------------------------------------------------- 
%  Nama  : Muhammad Arkan Ryanto
%  NIM   : 2510514017
%  Parameter: N=17, a=1, b=7, K=9, theta0=65, alpha=0.008 
%  Tanggal: 27 April 2026
% ===================================================== 
  
clc; clear; close all; 
  
% --- Parameter Personalisasi ---
N = 17;  a = 1;  b = 7;  K = 9; 
theta0 = 65;  
alpha_lr = 0.008; 
  
% 7.1 & 7.2: Identifikasi Pola & Operasi Sigma
t = 1:12; 
S = 50 + (K*t) + (a+1)*(-1).^t; 

% Verifikasi T1 dan T2
T1 = sum(S); 
T2 = sum(S.^2); 

fprintf('==========================================\n');
fprintf('Jawaban soal 7.2\n');
fprintf('T1 (Total Penjualan 12 Bulan) : %.4f\n', T1);
fprintf('T2 (Sum of Squares)           : %.4f\n\n', T2);

% 7.3: Deret Geometri & Pertumbuhan Pelanggan
G1 = K; 
r = 1 + (a/100); % r = 1.01

% Total akumulasi 10 bulan pertama (S10) menggunakan rumus manual
S10 = G1 * (r^10 - 1) / (r - 1);

% Mencari n minimum agar akumulasi melewati 500 pelanggan
n_min = 0;
S_accum = 0;
while S_accum <= 500
    n_min = n_min + 1;
    S_accum = G1 * (r^n_min - 1) / (r - 1);
end

fprintf('==========================================\n');
fprintf('Jawaban soal 7.3\n');
fprintf('Total Akumulasi S10           : %.4f\n', S10);
fprintf('n Minimum (Total Akumulasi > 500): %d bulan\n\n', n_min);

% 7.4: Forecasting 6 Bulan ke Depan 
% e) Regresi Linear menggunakan polyfit
p = polyfit(t, S, 1); 
slope = p(1); 
intercept = p(2); 

% Prediksi S13 sampai S18
t_pred = 13:18; 
S_pred = polyval(p, t_pred); 

% f) Hitung MAE (Mean Absolute Error)
S_fit = polyval(p, t); 
residual = S - S_fit;
MAE = mean(abs(residual)); 

fprintf('==========================================\n');
fprintf('Jawaban soal 7.4\n');
fprintf('Slope (b1)                    : %.4f\n', slope);
fprintf('Intercept (b0)                : %.4f\n', intercept);
fprintf('Mean Absolute Error (MAE)     : %.4f\n', MAE);

% Visualisasi 
hFig = figure; 
hold on; 
plot(t, S, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 7, ...
    'DisplayName', 'Data Historis (Biru, Titik)'); 

t_full = 1:18; 
S_trend_full = polyval(p, t_full); 
plot(t_full, S_trend_full, 'r--', 'LineWidth', 1.5, ...
    'DisplayName', 'Garis Tren (Merah Putus-putus) + Lanjutan'); 

plot(t_pred, S_pred, 'g^', 'MarkerFaceColor', 'g', 'MarkerSize', 9, ...
    'DisplayName', 'Prediksi S13-S18 (Hijau, Segitiga)'); 

% --- Pengaturan Grafik ---
grid on; 
title('Analisis Tren Penjualan'); 
xlabel('Bulan ke-n'); 
ylabel('Penjualan (Juta Rp)'); 

xlim([1 18]); 
legend('Location', 'northwest');
hold off;

% Save gambar
saveas(hFig, 'Grafik_forecasting_7.png');
fprintf('Grafik berhasil disimpan sebagai: Grafik_forecasting_7.png\n');