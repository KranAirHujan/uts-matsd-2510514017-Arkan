% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 3 — Himpunan dan Fungsi
%  --------------------------------------------------- 
%  Nama  : Muhammad Arkan Ryanto
%  NIM   : 17
%  Parameter: N=17, a=1, b=7, K=9, theta0=65, alpha=0.008 
%  Tanggal: 25 April 2026 
% ===================================================== 

clc; clear; close all; 

N = 17;      
a = 1;       
b = 7;        
K = 9;         
theta0 = 65;  
alpha_lr = 0.008; 

% Soal 3 b - Himpunan
U = N : N+20;
A = [N, N+2, N+4, N+7, N+10, N+13, N+15];
B = [N+3, N+5, N+7, N+10, N+12, N+18];
C = [N+1, N+7, N+10, N+11, N+17, N+20];

gabung_ABC = union(A, union(B, C));
luar_ABC = intersect(A, intersect(B, C));
AB_bukan_C  = setdiff(union(A, B), C); 
beda_AB = setxor(A, B);      

fprintf('===============================\n');
fprintf('|A U B U C|       : %d\n', length(gabung_ABC));
fprintf('|A n B n C|       : %d\n', length(luar_ABC));
fprintf('|(A U B) n C''|   : %d\n', length(AB_bukan_C));
fprintf('|A (+) B|         : %d\n\n', length(beda_AB));

% Soal 3 c
syms x;
f = K*x + (a+b);           
g = (x^2)/(b+1) + a;      

fog = simplify(subs(f, x, g));
gof = simplify(subs(g, x, f));

x_test = b + 2;
val_fog = double(subs(fog, x, x_test));
val_gof = double(subs(gof, x, x_test));

fprintf('===============================\n');
fprintf('(f o g)(x) : %s\n', char(fog));
fprintf('(g o f)(x) : %s\n', char(gof));
fprintf('Uji x=%d -> fog: %.2f, gof: %.2f\n', x_test, val_fog, val_gof);
if val_fog ~= val_gof
    fprintf('Kesimpulan : Tidak Komutatif\n\n');
end

% Soal 3 d
f_inv = solve(f == sym('y'), x);
f_inv = subs(f_inv, sym('y'), x); 

target = K*100 + a + b; 
x_sol = solve(f == target, x);

fprintf('===============================\n');
fprintf('Invers f^-1(x)     : %s\n', char(f_inv));
fprintf('Target Pendapatan  : %d ribu\n', target);
fprintf('Volume Pembelian x : %s\n', char(x_sol));

fplot(f, [0 110], 'LineWidth', 2); hold on;
yline(target, 'r--', 'Target Pendapatan');
plot(double(x_sol), target, 'ko', 'MarkerFaceColor', 'g');
title('Analisis Fungsi Harga ');
grid on; xlabel('x (Volume)'); ylabel('f(x) (Harga)');

drawnow;
saveas(gcf, 'Grafik_Fungsi_Harga_17.png');