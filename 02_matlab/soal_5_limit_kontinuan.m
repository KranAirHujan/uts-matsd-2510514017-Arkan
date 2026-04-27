% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 5 — Limit dan Kekontinuan
%  --------------------------------------------------- 
%  Nama  : Muhammad Arkan Ryanto 
%  NIM   : 17 
%  Parameter: N=17, a=1, b=7, K=9, theta0=65, alpha=0.008 
%  Tanggal: 26 April 2026 
% ===================================================== 
  
clc; clear; close all; 
  
N = 17;  a = 1;  b = 7;  K = 9; 
theta0 = 65; 
alpha_lr = 0.008; 
  
syms x n;

fprintf('===============================\n');
fprintf('Jawaban soal 5.1 & 5.2\n');

L1 = limit((x^2 - K^2)/(x - K), x, K);

L2 = limit((sqrt(x + (K+1)^2) - (K+1))/x, x, 0);

L3 = limit(((a+2)*x^3 + b*x + 7)/(x^3 - x + K), x, inf);

L4 = limit(sin((a+1)*x) * tan((b+2)*x) / x^2, x, 0);

fprintf('L1 (x -> K)     : %d\n', double(L1));
fprintf('L2 (x -> 0)     : %.2f\n', double(L2));
fprintf('L3 (x -> inf)   : %d\n', double(L3));
fprintf('L4 (x -> 0)     : %d\n', double(L4));


fprintf('===============================\n');
fprintf('Jawaban soal 5.3\n');

Rn = (100*n + K) / (n + (a+b+1));
steady_state = limit(Rn, n, inf);

diff_clv = sqrt(n^2 + K*n) - sqrt(n^2 + b*n);
limit_diff = limit(diff_clv, n, inf);

fprintf('d) Steady-state Revenue : Rp%d Juta\n', double(steady_state));
fprintf('e) Selisih Konvergen CLV: %d\n', double(limit_diff));

syms x n q_sym;

fprintf('===============================\n');
fprintf('Jawaban soal 5.4\n');

L_kiri = limit((x^2 - K^2)/(x - K), x, K, 'left'); 
L_kanan_sym = limit(a*x + q_sym, x, K, 'right');

p_val = double(L_kiri); 
q_res = solve(L_kanan_sym == L_kiri, q_sym);
q_val = double(q_res);

fprintf('Limit Kiri (x -> %d-) : %.2f\n', K, p_val);
fprintf('Limit Kanan (x -> %d+) : %d + q\n', K, a*K);
fprintf('-------------------------------\n');
fprintf('Nilai p agar kontinu: %.2f\n', p_val);
fprintf('Nilai q agar kontinu: %.2f\n', q_val);

figure(1);

f1 = @(x) (x.^2 - K^2)./(x - K);
fplot(f1, [0, K-0.01], 'b', 'LineWidth', 2); hold on;

plot(K, p_val, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);

f3 = @(x) a*x + q_val;
fplot(f3, [K+0.01, 2*K], 'g', 'LineWidth', 2);

line([K K], [0, p_val*1.5], 'Color', [0.5 0.5 0.5], 'LineStyle', '--');
title('Fungsi Biaya Kontinu C(x)');
xlabel('Unit Produk (x)'); ylabel('Biaya Distribusi C(x)');
grid on;
legend('x < K', 'x = K (Titik Sambung)', 'x > K', 'Batas K');

saveas(gcf, ['Grafik_Soal5_NIM_', num2str(N), '.png']);

fprintf('Grafik berhasil disimpan.\n');