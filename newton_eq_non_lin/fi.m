function fi = fi(n,d,delta,x,flag)

% renvoie des fonctions de   tests pour l’algorithme de résolution d’équations
% non linéaires et elle est utile pour l'algoritheme de more sorensne
%
% Entrée :
% x : variable de fonction
% n : vecteur de  valeurs des numérateurs
% d : vecteur de  valeurs des dénominateurs
% delta : constante
% flag : indicateur de type de la  fonction
%
% Sorties : fi tel que
%       si flag=1  fi = s(l)-delta^2
%       si flag=2  fi = 1/s(l) + 1/(dalta^2)
%           avec s(l)=sum((n(i)^2)/(x+d(i))^2)


    sum = 0;
    for i=1:length(n)
       sum = sum + (n(i)^2)/(x+d(i))^2; 
    end
    if(flag==1)
       fi = sum - delta^2 ; 
    elseif(flag==2)
        fi = 1/sum - 1/(delta^2) ;
    end
    
end

