clear all;
close all;
warning off;
addpath(genpath('../annexeA'));

gamma1=0.5 ; 
gamma2=2 ;
eta1=0.25 ;
eta2=0.75;
tol=0.001;
max_iter=50;

disp('Tests de problèmes sans contraintes : Méthode de régions de confiance (pas de cauchy) ')
flag_algo=1;
disp(' - Test f1 : ')
delta0=2;

disp('       - Point initial x011 : ')
x011=[1;0;0];
delta_max=10*norm(x011);
[x_sol,ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(@f1,@g_f1,@h_f1,x011,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo);
afficher_test_RC(x_sol,ng_sol,f_sol,nb_iter,flag , d)

disp('       - Point initial x012 : ')
x012=[10;3;-2.2];
delta_max=10*norm(x012);
[x_sol,ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(@f1,@g_f1,@h_f1,x012,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo);
afficher_test_RC(x_sol,ng_sol,f_sol,nb_iter,flag , d)



disp(' - Test f2 : ')
delta0=1;

disp('       - Point initial x021 : ')
x021=[-1.2;1];
delta_max=10*norm(x021);
[x_sol,ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(@f2,@g_f2,@h_f2,x021,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo);
afficher_test_RC(x_sol,ng_sol,f_sol,nb_iter,flag , d)

disp('       - Point initial x022 : ')
x022=[10;0];
delta_max=10*norm(x022);
[x_sol,ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(@f2,@g_f2,@h_f2,x022,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo);
afficher_test_RC(x_sol,ng_sol,f_sol,nb_iter,flag , d)

disp('       - Point initial x023 : ')
x023=[0;1/200+1e-11];
delta_max=10*norm(x023);
[x_sol,ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(@f2,@g_f2,@h_f2,x023,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo);
afficher_test_RC(x_sol,ng_sol,f_sol,nb_iter,flag , d)

fprintf('\n')
disp('************************************************************************************')
fprintf('\n') 
disp('Problèmes sans contraintes : Méthode de régions de confiance (pas de more-Sorensen) ')
flag_algo=2;
disp(' - Test f1 : ')
delta0=2;

disp('       - Point initial x011 : ')
x011=[1;0;0];
delta_max=10*norm(x011);
[x_sol,ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(@f1,@g_f1,@h_f1,x011,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo);
afficher_test_RC(x_sol,ng_sol,f_sol,nb_iter,flag , d)

disp('       - Point initial x012 : ')
x012=[10;3;-2.2];
delta_max=10*norm(x012);
[x_sol,ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(@f1,@g_f1,@h_f1,x012,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo);
afficher_test_RC(x_sol,ng_sol,f_sol,nb_iter,flag , d)



disp(' - Test f2 : ')
delta0=1;

disp('       - Point initial x021 : ')
x021=[-1.2;1];
delta_max=10*norm(x021);
[x_sol,ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(@f2,@g_f2,@h_f2,x021,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo);
afficher_test_RC(x_sol,ng_sol,f_sol,nb_iter,flag , d)

disp('       - Point initial x022 : ')
x022=[10;0];
delta_max=10*norm(x022);
[x_sol,ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(@f2,@g_f2,@h_f2,x022,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo);
afficher_test_RC(x_sol,ng_sol,f_sol,nb_iter,flag , d)

disp('       - Point initial x023 : ')
x023=[0;1/200+1e-11];
delta_max=10*norm(x023);
[x_sol,ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(@f2,@g_f2,@h_f2,x023,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo);
afficher_test_RC(x_sol,ng_sol,f_sol,nb_iter,flag , d)





