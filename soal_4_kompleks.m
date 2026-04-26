 % ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 4 — Bilangan Kompleks dan Fasor (Fitur Auto-Save)
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

z1 = (a+2) + (b+1)*1i; 
z2 = (b+1) - (a+2)*1i; 

% --- Jawaban Bagian 4a ---
fprintf('===============================\n');
fprintf('Jawaban soal 4a\n');
r1 = abs(z1);
theta1_deg = rad2deg(angle(z1));
r2 = abs(z2);
theta2_deg = rad2deg(angle(z2));

fprintf('z1 = %.4f * cis(%.4f deg)\n', r1, theta1_deg);
fprintf('z2 = %.4f * cis(%.4f deg)\n', r2, theta2_deg);


% --- Jawaban Bagian 4b ---
fprintf('===============================\n');
fprintf('Jawaban soal 4b\n');
res_tambah = z1 + z2;
res_kali   = z1 * z2;
res_bagi   = z1 / z2;

fprintf('z1 + z2   = %.4f + %.4fi\n', real(res_tambah), imag(res_tambah));
fprintf('z1 * z2   = %.4f + %.4fi\n', real(res_kali), imag(res_kali));
fprintf('z1 / z2   = %.4f + %.4fi\n', real(res_bagi), imag(res_bagi));
fprintf('|z1 - z2| = %.4f\n', abs(z1 - z2));


% --- Jawaban Bagian 4c ---
fprintf('===============================\n');
fprintf('Jawaban soal 4c\n');
z1_pangkat4_aljabar = z1 * z1 * z1 * z1;
z1_pangkat4_demoivre = (r1^4) * exp(1i * 4 * angle(z1));

fprintf('Hasil Aljabar (z1.z1.z1.z1) : %.4f + %.4fi\n', real(z1_pangkat4_aljabar), imag(z1_pangkat4_aljabar));
fprintf('Hasil De Moivre (r^4 cis 4th): %.4f + %.4fi\n', real(z1_pangkat4_demoivre), imag(z1_pangkat4_demoivre));
fprintf('Selisih (Error)             : %.4e\n', abs(z1_pangkat4_aljabar - z1_pangkat4_demoivre));


% --- Jawaban Bagian 4d ---
fprintf('===============================\n');
fprintf('Jawaban soal 4d\n');
w_mag = 8;
w_angle_rad = deg2rad(theta0);
k = 0:2;
r_k = w_mag^(1/3); 
theta_k = (w_angle_rad + 2*pi*k) / 3;
akar_kubik = r_k * exp(1i * theta_k);

for j = 1:3
    fprintf('Akar %d: %.4f * cis(%.4f deg) atau %.4f + %.4fi\n', ...
        j-1, r_k, rad2deg(theta_k(j)), real(akar_kubik(j)), imag(akar_kubik(j)));
end


% --- Jawaban Bagian 4e ---
fprintf('===============================\n');
fprintf('Jawaban soal 4e\n');
figure(1);
compass(akar_kubik, 'b'); hold on;
plot([akar_kubik, akar_kubik(1)], 'r--', 'LineWidth', 1.5);

title(['Akar Kubik w = 8 cis(', num2str(theta0), ') ']);
grid on;
legend('Akar Kubik (Fasor)', 'Bentuk Segitiga', 'Location', 'northeastoutside');

nama_file = ['Grafik_Argand_', num2str(N), '.png'];
saveas(gcf, nama_file);

fprintf('Grafik berhasil disimpan dengan nama: %s\n', nama_file);
fprintf('===============================\n');