%% Modélisation en Boucle Ouverte
A = [-0.2415 0.2415 0;
      0.2415 -0.4244 0.1566;
      0 0.1566 -0.1865];
B = [795.7747; 0; 0];
C = [0 0 1];
D = zeros(1,1);
Sys_O = ss(A, B, C, D);
%% Commande Dynamique
%%P = [-0.6299 -0.6299 -0.6299];
P = 1/3*[-0.6299 -0.6299 -0.6299];


K = acker(A,B,P);

Ac = A - B*K;
[b,a] = ss2tf(Ac, B, C, D);
H = tf(b,a);
%% Compensation statique
H0 = C/(-A+B*K)*B;
Sys_F = ss(Ac, B/H0, C, D);
%% Commande avec Action Intégrale
Pi = [-0.5 -0.5 -0.5 -0.5];
Aa = [A zeros(3,1); -C zeros(1,1)];
Ba = [B; zeros(1)];
Ka_Kia = acker(Aa, Ba, Pi);
Ka = Ka_Kia(1,1:3);
Kia = Ka_Kia(1,4);
%% Synthèse observateur
Po = [-0.6299 -0.6299 -0.6299]*10;
L = acker(A',C',Po);
L = L';