function [ x_sol,f_sol,nb_itr,flag] = newton_local(f,x0,tol,max_itr,g_f,h_f )


%Résoudre le probléme d'optimisation sans contraint 
%min f (x),x∈Rn
%où la fonction f est de classe C2 sur Rn
%avec la méthode de newton local
%
%En Entrée :
% f : la fonction f que l'on veut minimiser
% x0 : 
% tol : la précision demandée
% max_iter : le nombre maximum d'itérations.
% g_f : la fonction gradiant de f
% h_f : la fonction hessienne de f
%
%En Sortie :
% x_sol : itére final
% f_sol : valeur de la fonction objectif en xsol 
% nb_itr : nombre d'itérations
% flag : indicateur de deroulement de l’algorithme :
%       0 : convergence       
%       1 : Distance entre les itérés trop faible pour poursuivre
%       2 : Distance entre les f(itéres) trop faibles pour poursuivre
%       3 : nombre max d'itération atteint
%       -1:Une erreur s’est produite


flag=-1;
x_sol=x0;
nb_itr=0;
f_sol = f(x0);
g_0 = g_f(x0);
g_k = g_f(x0);
h_k = h_f(x0);
cond0=norm(g_k) > tol*(norm(g_0)+sqrt(eps));
cond1=true;
cond2=true;
cond3=nb_itr<max_itr;
cond=cond0 && cond3;



%tant que cond est vérfie ( c-à-d aucun condition d'arrête n'est verfiée)
while (cond) 
    %calculer de d_k
    d_k = -h_k\g_k;
    %mise à jour des variables
    x_sol = x_sol + d_k;
    f_sol = f(x_sol);
    g_k = g_f(x_sol);
    h_k = h_f(x_sol);
    nb_itr = nb_itr + 1;
    
    
    %mise à jour des conditions d'arrête
    cond0=norm(g_k) > tol*(norm(g_0)+sqrt(eps));
    cond1=norm(d_k) >tol*(norm(x_sol-d_k)+sqrt(eps));
    cond2=abs(f_sol-f(x_sol-d_k)) > eps*(abs(f(x_sol))+sqrt(eps));
    cond3=nb_itr<max_itr;
    cond=cond0 && cond1 && cond2 && cond3;
end

%calculer le flag selon la condition de sortie
if(~cond0)
    flag = 0;
elseif (~cond1)
    flag= 1;
elseif (~cond2)
    flag = 2;
elseif (~cond3)
    flag = 3;
end


end

  