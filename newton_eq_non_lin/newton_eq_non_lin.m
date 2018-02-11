function [ l,fl,nb_itr ] = newton_eq_non_lin(l_min , l_max,tol,max_itr ,fi,d_fi)


% Resolution du sous-probleme de more-Sorensen
%
% newton_eq_non_lin(l_min , l_max,tol,max_itr ,fi,d_fi) renvoie le zéro de la 
% fonction di c-à-d l tq fi(l)=0 avec une précision tol
% 
%Entrée :
% fi : une fonction de variable réelle pour laquelle on cherche un zéro
% d_fi : la fonction dérivée de fi
% tol : la précision demandée
% max_iter : le nombre maximum d'itérations.
% l_min , l_max : des valeurs réelles tel que fi(l_min)*fi(l_max)<=0
% 
%
%Sortie :
% l : la valeur approché de zéro de fi
% fl : valeur de f en l
% nb_itr : nombre d'itération


nb_itr=0;
if abs(min(fi(l_min),fi(l_max))) <= tol
    if abs(fi(l_min))>abs(fi(l_max))
        l=l_max;
    else
        l=l_min;
    end
else
    l=l_max;
     while abs(fi(l)) > tol && nb_itr<max_itr
         l_N=l-(fi(l)/d_fi(l));
         if((l_min<=l_N && l_N<=l_max ||l_max<=l_N && l_N<=l_min ) && abs(fi(l_N))<0.5*abs(fi(l)))
             l=l_N;
         else
             l_D=(l_min+l_max)/2;
             if((fi(l_D)>0 && fi(l_max)>0) ||(fi(l_D)<0 && fi(l_max)<0))
                 l_max=l_D;
             else
                 l_min=l_D;
             end
             l=l_D;

         end
         nb_itr=nb_itr+1;
     end
end
fl=fi(l);
end
