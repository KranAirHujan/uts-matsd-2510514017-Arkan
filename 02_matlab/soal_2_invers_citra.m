% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 2 — veifikasi invers matriks dan visualisasi enkripsi citra grayscale
%  --------------------------------------------------- 
%  Nama  : Muhammad Arkan Ryanto
%  NIM   : 17
%  Parameter: N=17, a=1, b=7, K=9, theta0=65, alpha=0.008 
%  Tanggal: 25 April 2026 
% ===================================================== 

clc; clear; close all;

N = 17; a = 1; b = 7; 
K=9; 
theta0=65; 
alpha=0.008;

% Soal 2d — Verifikasi Invers Manual vs MATLAB
A = [a+1, b, 2; 
     1, a+2, b; 
     b, 1, a+3];

A_inv = inv(A);

[n, m] = size(A);
C = zeros(n, m); 

for i = 1:n
    for j = 1:m
        subA = A;
        subA(i, :) = []; 
        subA(:, j) = []; 
        C(i,j) = ((-1)^(i+j)) * det(subA);
    end
end

A_inv_manual = C' / det(A);

error_fro = norm(A_inv_manual - A_inv, 'fro');

fprintf('================================\n');
fprintf('Determinan A: %.2f\n', det(A));
fprintf('Norma Error Frobenius: %.2e\n', error_fro);

% Soal 2f — Visualisasi Rekonstruksi Citra Grayscale
P = [120, (50 + N), 200; 
     80, (a + 2), (10 + N); 
     (30 + N), 90, 170];

E = A * P;

P_de = A_inv * E;

fprintf('================================\n');
disp('Matriks Piksel Asli (P):'); disp(P);
disp('Matriks Terenkripsi (E):'); disp(E);
disp('Matriks Hasil Dekripsi (P''):'); disp(round(P_de));

figure('Name', 'Visualisasi Enkripsi Citra ', 'Color', 'k');

subplot(1,2,1);
imshow(uint8(P), []); 
title('Blok Piksel Asli (P)');
xlabel(['NIM: ', num2str(N)]);
colorbar;

subplot(1,2,2);
imshow(uint8(E), []); 
title('Blok Piksel Enkripsi (E)');
xlabel('Hasil: A * P');
colorbar;

folderName = 'gambar';
saveas(gcf, fullfile(folderName, 'Visualisasi_Enkripsi_17.png'));