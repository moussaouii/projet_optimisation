function [x_sol, f_sol, l_k, mu_k, nb_iter, flag] = Lagrangien_augmente(f,g_f,h_f,c,g_c,h_c,mu0, to , eta0_ch, alpha, beta, eps0, eta0, x0 ,l0 ,tol , max_iter ,type_algo)
     
%Résoudre le probléme d'optimisation avec contraint 
%min f (x),x∈Rn avec c(x)=0
%où la fonction f est de classe C2 sur Rn
%avec la méthode de région confiance
%
% Entrée :
% f : la fonction objectif
% g_f : la fonction gradiant de f
% h_f : la fonction hessienne de f
% c : la fonction condition (c(x)=0)
% g_c : la fonction gradiant de c
% h_c : la fonction hessienne de c
% mu0 : valeur de muk intial
% to : constante d'algritheme
% eta0_ch : constante d'algritheme(eta0_ch=0.1258925)
% alpha : constante d'algritheme (alpha=0.1)
% beta : constante d'algritheme (beta=0.9 )
% eps0 : constante d'algritheme ( eps0=1/mu0 )
% eta0 : constante d'algritheme ( eta0=eta0_ch/(mu0^alpha) )
% x0 : itére initial
% l0 : multiplicateur de lagrange
% tol : la précision demandée
% max_iter : le nombre maximum d'itérations.
% type_algo : type d'algoritheme pour la r ́esolution de la suite de probl ́emes sans contraintes
%               1   newton local
%               2   région de confinace ( pas de cauchy )
%               3   région de confinace  (Moré Sorensen)


% Sorties :
% x_sol : itere final
% l_k : multiplicateur de lagrange final
% mu_k : mu final
% f_sol : valeur de la fonction objectif en x_sol
% flag : indicateur de deroulement de l’algorithme :
%       0 : convergence       
%       1 : nombre max d'itération atteint
%      -1 : une erreur est produit
    








 

    
    %% Initialisation des variables
    flag=-1;
    nb_iter = 0;
    eta_k = eta0;
    l_k = l0;
    mu_k = mu0;
    eps_k = eps0;
    x_sol = x0;
    cond = true;
    
    %% tant que non convergence
    while cond && nb_iter<max_iter
        %% Calcul du Langrangien et sa gradiant et son sa  hessienne
        L= @(x) LA(f,c,l_k,mu_k,x);
        gL = @(x) gradLA( g_f , c , g_c , l_k , mu_k , x);
        hL= @(x) hessLA(  h_f , h_c , c , g_c , l_k , mu_k , x);
        %% Calcul du min du problème sans contraintes du Langrangien 
        delta_max=10*norm(x_sol);
        
        if type_algo==1
             addpath(genpath('../newton_local'));
             max_itr_newton=100;
             x_sol = newton_local(L,x_sol,eps_k,max_itr_newton,gL,hL );
        elseif type_algo==2
            %% region de confiance (pas de cauchy)
            addpath(genpath('../region_confiance'));
             %% Initialisation des variables de région de confiance
            delta0 = 1;
            gamma1 = 0.5;
            gamma2 = 2;
            eta1 = 0.25;
            eta2 = 0.75;
            flag_algo=1; %algorithme de cauchy
            max_iter_RC = 100 ;
            x_sol= region_confiance(L,gL,hL,x_sol,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter_RC,eps_k,flag_algo);
            
        elseif type_algo==3
            %% region de confiance (Moré Sorensen)
            addpath(genpath('../region_confiance'));
             %% Initialisation des variables de région de confiance
            delta0 = 1;
            gamma1 = 0.5;
            gamma2 = 2;
            eta1 = 0.25;
            eta2 = 0.75;
            flag_algo=2; %algorithme de more-sorensene
            max_iter_RC = 50 ;
            x_sol= region_confiance(L,gL,hL,x_sol,delta_max,delta0,gamma1,gamma2,eta1,eta2,max_iter_RC,eps_k,flag_algo);
        else
            disp('error flag_algo non définie');
            
        end
        %% S'arreter si convergence de l'algo global
        if ( (norm(gL(x_sol)) <= eps_k) && (norm(c(x_sol))<=tol)  )
            cond = false;
        else
            if(norm(c(x_sol)) <= eta_k)% mettre à jour (entre autres) les multiplicateurs 
                   l_k = l_k + mu_k * c(x_sol);
                   %muk ne change pas
                   eps_k = eps_k / mu_k;
                   eta_k = eta_k / (mu_k^beta);
            else % mettre à jour (entre autres) le paramètre de pénalité :
                    %pas de changement du lambdak
                    mu_k = to * mu_k;
                    eps_k = eps0 / mu_k;
                    eta_k = eta0_ch/ (mu_k^alpha);
            end
        end
        nb_iter=nb_iter+1;
    end
        
    if(~cond)
        flag=0;
    elseif(nb_iter>=max_iter)
        flag=1;
    end
        
    f_sol=f(x_sol);
        
end



