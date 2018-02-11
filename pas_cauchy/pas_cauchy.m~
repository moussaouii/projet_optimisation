function [ s , d ] = pas_cauchy( g,H,delta )

% Resolution du sous-probleme de regions de confiance
%	min g'*s + 0.5*s'*H*s s.t. ||s|| <= delta
% par l'algorithme de More-Sorensen.
%
% pas_cauchy( g,H,delta ) renvoie le pas obtenu par l'algorithme 
% de pas de cauchy c-à-d min q(-t*g)= - t*norm(g)^2 + (t^2/2)*(g'*H*g)
%
%%En Entrée :
% g : la fonction gradiant de f en x_k
% H : la fonction hessienne de f en x_k
% delta : rayon de  la région de confiance à l'itération k
%
%%En sortie
% s : minimum trouvé
% d : la décroissance obtenue avec cette algoritheme
%
%%Résolution de probléme : q(s)=g'*s+(1/2)*s'*H*s
% c-à-d Trouver t>0 tq q(s=-t*g) est minimale et norm(s)<=delta


% q(-t*g)= - t*norm(g)^2 + (t^2/2)*(g'*H*g)
if g == 0
   s=g; 
else
    if g'*H*g <=0
        s=-(delta/norm(g))*g;
    else
        if norm(g)^3 <= delta*g'*H*g
            s=-(norm(g)^2/(g'*H*g))*g;
        else
            s=-(delta/norm(g))*g;
        end
    end  
end
    d=g' * s+ 0.5 *s' * H * s;

end

