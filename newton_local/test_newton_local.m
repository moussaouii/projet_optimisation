clear all;
close all;
warning off;
addpath(genpath('../annexeA'));


max_itr = 100;
tol=1e-6;
disp('tests des problèmes sans contraintes : Méthode du newton localavec l''annexe:A')


disp(' - Test f1 : ')

disp('       - Point initial x011 : ')
x011 = [1 ;0 ;0];
[ x_sol,f_sol,nb_itr,flag] = newton_local(@(x)f1(x),x011,tol,max_itr,@(x)g_f1(x),@(x)h_f1(x) );
afficher_test_newton_local(x_sol,f_sol,nb_itr,flag);    

disp('       - Point initial x012 : ')
x012 = [10 ;3 ;-2.2];
[ x_sol,f_sol,nb_itr,flag] = newton_local(@(x)f1(x),x012,tol,max_itr,@(x)g_f1(x),@(x)h_f1(x) );
afficher_test_newton_local(x_sol,f_sol,nb_itr,flag);    


disp(' - Test f2 : ')

disp('       - Point initial x021 : ')
x021 = [-1.2 ; 1];
[ x_sol,f_sol,nb_itr,flag] = newton_local(@(x)f2(x),x021,tol,max_itr,@(x)g_f2(x),@(x)h_f2(x) );
afficher_test_newton_local(x_sol,f_sol,nb_itr,flag);    

disp('       - Point initial x022 : ')
x022 = [10 ; 0];
[ x_sol,f_sol,nb_itr,flag] = newton_local(@(x)f2(x),x022,tol,max_itr,@(x)g_f2(x),@(x)h_f2(x) );
afficher_test_newton_local(x_sol,f_sol,nb_itr,flag);    

disp('       - Point initial x023 : ')
x023 = [0 ; (1/200) + (1/10^12)];
[ x_sol,f_sol,nb_itr,flag] = newton_local(@(x)f2(x),x023,tol,max_itr,@(x)g_f2(x),@(x)h_f2(x) );
afficher_test_newton_local(x_sol,f_sol,nb_itr,flag);    


