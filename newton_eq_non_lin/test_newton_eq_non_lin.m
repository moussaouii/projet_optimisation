clear all;
close all;
addpath(genpath('../annexeC'));

tol=1e-6;
max_itr=100;
l_min=100;
l_max=0;

disp('Tests de la méthode Newton pour résoudre les équations non linéaires avec l''annexe:F ')
disp(' -Fonctions du type 1')
flag=1;%type de fonction


[n,d,delta]=annexeC(1);
f=@(x) fi(n,d,delta,x,flag);
df=@(x) d_fi(n,d,delta,x,flag);
disp(['     -1 avec delta =',num2str(delta),', lmin=',num2str(l_min),', f(lmin)=',num2str(f(l_min)),', lmax=',num2str(l_max),', f(lmax)=',num2str(f(l_max))]);
[ l,fl,nb_itr ] = newton_eq_non_lin(l_min , l_max,tol,max_itr ,f,df);
disp(['         nombre d''itération: ',num2str(nb_itr),', zéro de fonction l= ',num2str(l),', f(l)= ',num2str(fl)]);

[n,d,delta]=annexeC(2);
f=@(x) fi(n,d,delta,x,flag);
df=@(x) d_fi(n,d,delta,x,flag);
disp(['     -2 avec delta =',num2str(delta),', lmin=',num2str(l_min),', f(lmin)=',num2str(f(l_min)),', lmax=',num2str(l_max),', f(lmax)=',num2str(f(l_max))]);
[ l,fl,nb_itr ] = newton_eq_non_lin(l_min , l_max,tol,max_itr ,f,df);
disp(['         nombre d''itération: ',num2str(nb_itr),', zéro de fonction l= ',num2str(l),', f(l)= ',num2str(fl)]);

[n,d,delta]=annexeC(3);
f=@(x) fi(n,d,delta,x,flag);
df=@(x) d_fi(n,d,delta,x,flag);
disp(['     -2 avec delta =',num2str(delta),', lmin=',num2str(l_min),', f(lmin)=',num2str(f(l_min)),', lmax=',num2str(l_max),', f(lmax)=',num2str(f(l_max))]);
[ l,fl,nb_itr ] = newton_eq_non_lin(l_min , l_max,tol,max_itr ,f,df);
disp(['         nombre d''itération: ',num2str(nb_itr),', zéro de fonction l= ',num2str(l),', f(l)= ',num2str(fl)]);



disp(' -Fonctions du type 2')
flag=2;%type de fonction


[n,d,delta]=annexeC(1);
f=@(x) fi(n,d,delta,x,flag);
df=@(x) d_fi(n,d,delta,x,flag);
disp(['     -1 avec delta =',num2str(delta),', lmin=',num2str(l_min),', f(lmin)=',num2str(f(l_min)),', lmax=',num2str(l_max),', f(lmax)=',num2str(f(l_max))]);
[ l,fl,nb_itr ] = newton_eq_non_lin(l_min , l_max,tol,max_itr ,f,df);
disp(['         nombre d''itération: ',num2str(nb_itr),', zéro de fonction l= ',num2str(l),', f(l)= ',num2str(fl)]);

[n,d,delta]=annexeC(2);
f=@(x) fi(n,d,delta,x,flag);
df=@(x) d_fi(n,d,delta,x,flag);
disp(['     -2 avec delta =',num2str(delta),', lmin=',num2str(l_min),', f(lmin)=',num2str(f(l_min)),', lmax=',num2str(l_max),', f(lmax)=',num2str(f(l_max))]);
[ l,fl,nb_itr ] = newton_eq_non_lin(l_min , l_max,tol,max_itr ,f,df);
disp(['         nombre d''itération: ',num2str(nb_itr),', zéro de fonction l= ',num2str(l),', f(l)= ',num2str(fl)]);

[n,d,delta]=annexeC(3);
f=@(x) fi(n,d,delta,x,flag);
df=@(x) d_fi(n,d,delta,x,flag);
disp(['     -2 avec delta =',num2str(delta),', lmin=',num2str(l_min),', f(lmin)=',num2str(f(l_min)),', lmax=',num2str(l_max),', f(lmax)=',num2str(f(l_max))]);
[ l,fl,nb_itr ] = newton_eq_non_lin(l_min , l_max,tol,max_itr ,f,df);
disp(['         nombre d''itération: ',num2str(nb_itr),', zéro de fonction l= ',num2str(l),', f(l)= ',num2str(fl)]);