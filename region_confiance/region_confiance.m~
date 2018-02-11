function [x_sol, ng_sol, f_sol, nb_iter ,flag , d ] = region_confiance(f,g_f,h_f,x0,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol,flag_algo)


%Résoudre le probléme d'optimisation sans contraint 
%min f (x),x∈Rn
%où la fonction f est de classe C2 sur Rn
%avec la méthode de région confiance
%
% Entrée :
% f : la fonction objectif
% g_f : la fonction gradiant de f
% h_f : la fonction hessienne de f
% tol : la précision demandée
% max_iter : le nombre maximum d'itérations.
% delta_max : rayon de région de confiance max
% delta0 : rayon de région de confiance initial
% gamma1,gamma2,eta1,eta2 : les constantes des régions de confiance 
% 0 < gamma1 < 1 < gamma2 et 0 < eta1 < eta2 < 1.
% type_algo: le type d'algorithem pou calculer le pas 
%             1 : par le pas de cauchy
%             2 : par More-Sorensen
%
% Sorties :
% x_sol : itere final
% ng_sol : norme du gradient en xsol
% nb_iter: nombre d'itérations
% f_sol : valeur de la fonction objectif en x_sol
% d: la décroisance de fonction objectif
% flag : indicateur de deroulement de l’algorithme :
%       0 : convergence       
%       1 : Distance entre les itérés trop faible pour poursuivre
%       2 : Distance entre les f(itéres) trop faibles pour poursuivre
%       3 : nombre max d'itération atteint
%       -1:Une erreur s’est produite

    flag=-1;
    x_sol=x0;
    nb_iter=0;
    f_sol = f(x0);
    f0 = f(x0);
    g0 = g_f(x0);
    g_k = g_f(x0);
    h_k = h_f(x0);
    delta_k=delta0;
    cond0=norm(g_k) > tol*(norm(g0)+sqrt(eps));
    cond1=true;
    cond2=true;
    cond3=nb_iter<max_iter;
    cond=cond0 && cond3;


    %tant que cond est vérfie ( c-à-d aucun condition d'arrête n'est verfiée)
    while (cond)
        %Calcul de sk selon flag_algo
         if(flag_algo==1)
             addpath(genpath('../pas_cauchy'));
             sk = pas_cauchy(g_k,h_k,delta_k);
         elseif(flag_algo==2)
             addpath(genpath('../more_sorensen'));
             [sk,~,~] = more_sorensen(g_k,h_k,delta_k,tol);
         else
             disp('error flag_algo non définie');
         end


        %Calcul de pk
        pk=(f(x_sol)-f(x_sol+sk))/(-(g_k'*sk+(1/2)*sk'*h_k*sk));

        %Mettre à jour  de l'itéré et le rayon de région de confiance 
        if pk>=eta1
            x_sol=x_sol+sk;
             f_sol=f(x_sol);        
             g_k=g_f(x_sol);
             h_k = h_f(x_sol);
             cond1 = norm(sk) > tol*(norm(x_sol-sk)+sqrt(eps));
             cond2 = abs(f_sol-f(x_sol-sk)) > tol*(abs(f(x_sol-sk))+sqrt(eps));
        else
            cond1=true;
            cond2=true;
        end
        if pk>=eta2 
            delta_k=min(gamma2*delta_k,delta_max);
        elseif ~((eta1<=pk) && (pk<eta2))
            delta_k=gamma1*delta_k;
        end


        %mise à jour de nombre d'itérations
        nb_iter = nb_iter + 1;

        %mise à jour des conditions d'arrête
        cond0=norm(g_k) > tol*(norm(g0)+sqrt(eps));
        cond3=nb_iter<max_iter;
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

    ng_sol=norm(g_k);
    d=f0-f_sol;
end




