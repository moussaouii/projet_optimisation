function [ s , l ,d, flag] = more_sorensen( g,h,delta,tol )


% Resolution du sous-probleme de regions de confiance
%	min g'*s + 0.5*s'*H*s s.t. ||s|| <= delta
% par l'algorithme de More-Sorensen.
%
% more_soernsen(g,h,delta,tol) renvoie le pas obtenu par l'algorithme 
% de More-Sorensen pour un modele quadratique de partie lineaire G'*s et de 
% partie quadratique 1/2*s'*H*s, dans une region de confiance de rayon 
% DELTA. Il utilise un algorithme de resolution d'equations non lineaires
%
%En Entrée :
% delta :  reel positif (rayon de région de confinace)
% tol : la précision demandée pour le recherche de zéro de fi par la
%       méthode newton non liniére
%	g : vecteur de taille n x 1
%	H : matrice de taille n x n (symmétrique, mais non nécessairement définie positive) 
%
%En Sortie :
% s : pas de more sorensen
% l : valeur du multiplicateur de Lagrange obtenu
% d : la décroissance obtenue avec cette algoritheme
% flag : indicateur de deroulement de l’algorithme :
%       1 : solution intérieure      
%       2 : solution sur la frontière et q1 * g' != 0
%       3 : solution sur la frontière et q1 * g' = 0 et norm(s_(−λ1)) > delta
%       4 : solution sur la frontière cas difficile  
%           (q1 * g' = 0 et norm(s_(−λ1)) < delta )
%      -1 : Une erreur s’est produite

addpath(genpath('../newton_eq_non_lin'));
    
    flag=-1;
    % recherche d'une solution intérieure
    [q,d]=eig(h);
    sn = -h\g;
    % On tri les valeurs propros selon  l'ordre croissant
    vp=sort(diag(d),'ascend');
    if min(vp(1))>=0 && norm(sn,2) < delta 
        % H>=0 et le pas de Newton (sn) est intérieur
        flag=1;% solution intérieure 
        s = sn;
        l = 0;    
    else % solution sur la frontière
        nem = q'*g;
        if q(:,1)' * g ~= 0  % 2 cas ( q1 * g' != 0 )
            flag=2;
            l_min=max(0,-vp(1));
            l_max=l_min+2^10;
            phi = @(x) fi( nem , vp , delta , x , 1 ) ;
            dfi = @(x) d_fi(nem,vp,delta,x,1); 
            [ l, ~ , ~ ] = newton_eq_non_lin(l_min , l_max,tol,1000 ,phi,dfi);
            s=-(h + (l* eye(size(h))))\g;
        else %( q1 * g' = 0 )
            s_lambda1=zeros(length(g),1);
            for i=2:length(vp)
                s_lambda1 =  s_lambda1 - (nem(i)*q(:,i))/(vp(i)-vp(1)); 
            end
            if(norm(s_lambda1) > delta)
                % 3 éme cas 
                    flag=3;
                    l_min=max(0,-vp(1));
                    l_max=l_min+2^10;
                    nem = q'*g;
                    phi = @(x) fi( nem , vp , delta , x , 1 ) ;
                    dfi = @(x) d_fi(nem,vp,delta,x,1); 
                    [ l, ~ , ~ ] = newton_eq_non_lin(l_min , l_max,1e-6,1000 ,phi,dfi);
                    s=-(h + (l* eye(size(h))))\g;  
            else% 4 éme cas (cas difficile)
                 flag=4;
                 l = -vp(1);
                 s =s_lambda1+sqrt(delta^2 -norm(s_lambda1)^2)*q(:,1) ;
            end
        end
    end
    d=-(g' * s+ 0.5 *s' * h * s);
end

