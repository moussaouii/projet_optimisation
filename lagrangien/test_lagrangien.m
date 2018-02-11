clear all;
close all;


addpath(genpath('../annexeE'));
addpath(genpath('../annexeA'));

alpha=0.1; 
beta=0.9; 
eta0_ch=0.1258925; 
max_iter=100;
tol=1e-3;
to = 1.5; % t>1 pour assurer mk --> infini
disp('Tests des problèmes avec contraintes : méthode du Lagrangien Augmenté avec l''annexe:E')
disp(' -Rŕesolution de la suite de problemes sans contraintes avec newton local');
type_algo=1;
disp('   -test f1')
f=@f1;
g_f=@g_f1;
h_f=@h_f1;
c =@c1;
g_c=@g_c1;
h_c=@h_c1;
mu0=10; 
eta0=eta0_ch/(mu0^alpha);
eps0=1/mu0; 
disp('       -Point initial xc11 (Realisable) ')
xc11=[0;1;1];
l0=0;

[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc11 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);

disp('       -Point initial xc12 (Non Realisable) ')
xc12=[0.5 ; 1.25; 1];
[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc12 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);

disp('   -test f2')
f=@f2;
g_f=@g_f2;
h_f=@h_f2;
c =@c2;
g_c=@g_c2;
h_c=@h_c2;
mu0=10; 
eta0=eta0_ch/(mu0^alpha);
eps0=1/mu0; 
disp('       -Point initial xc21 (Non realisable) ')
xc21 = [1 ; 0];
l0=0;
[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc21 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);

disp('       -Point initial xc22 (Realisable) ')
xc22 = (sqrt(3)/2)*[1 ; 1];
[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc22 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);


fprintf('\n')
disp('************************************************************************************')
fprintf('\n')

disp('-Tests des problèmes avec contraintes : méthode du Lagrangien Augmenté')
disp(' -Rŕesolution de la suite de problemes sans contraintes avec Région de confiance(pas de cauchy)');
type_algo=2;
disp('   -test f1')
f=@f1;
g_f=@g_f1;
h_f=@h_f1;
c =@c1;
g_c=@g_c1;
h_c=@h_c1;
mu0=10; 
eta0=eta0_ch/(mu0^alpha);
eps0=1/mu0; 
disp('       -Point initial xc11 (Realisable) ')
xc11=[0;1;1];
l0=0;

[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc11 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);

disp('       -Point initial xc12 (Non Realisable) ')
xc12=[0.5 ; 1.25; 1];
[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc12 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);

disp('   -test f2')
f=@f2;
g_f=@g_f2;
h_f=@h_f2;
c =@c2;
g_c=@g_c2;
h_c=@h_c2;
mu0=10; 
eta0=eta0_ch/(mu0^alpha);
eps0=1/mu0; 
disp('       -Point initial xc21 (Non realisable) ')
xc21 = [1 ; 0];
l0=0;
[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc21 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);

disp('       -Point initial xc22 (Realisable) ')
xc22 = (sqrt(3)/2)*[1 ; 1];
[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc22 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);




fprintf('\n')
disp('************************************************************************************')
fprintf('\n')

disp('-Tests des problèmes avec contraintes : méthode du Lagrangien Augmenté')
disp(' -Rŕesolution de la suite de problemes sans contraintes avec Région de confiance (Moré Sorensen)');
type_algo=3;
disp('   -test f1')
f=@f1;
g_f=@g_f1;
h_f=@h_f1;
c =@c1;
g_c=@g_c1;
h_c=@h_c1;
mu0=10; 
eta0=eta0_ch/(mu0^alpha);
eps0=1/mu0; 
disp('       -Point initial xc11 (Realisable) ')
xc11=[0;1;1];
l0=0;

[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc11 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);

disp('       -Point initial xc12 (Non Realisable) ')
xc12=[0.5 ; 1.25; 1];
[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc12 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);

disp('   -test f2')
f=@f2;
g_f=@g_f2;
h_f=@h_f2;
c =@c2;
g_c=@g_c2;
h_c=@h_c2;
mu0=10; 
eta0=eta0_ch/(mu0^alpha);
eps0=1/mu0; 
disp('       -Point initial xc21 (Non realisable) ')
xc21 = [1 ; 0];
l0=0;
[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc21 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);

disp('       -Point initial xc22 (Realisable) ')
xc22 = (sqrt(3)/2)*[1 ; 1];
[x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0 , xc22 ,l0 ,tol , max_iter , type_algo );
afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag);
