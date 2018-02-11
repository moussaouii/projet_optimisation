function d_fi = d_fi(n, d, delta,x, flag)

% renvoie les dérives des fonctions de  tests pour l’algorithme de résolution d’équations
% non linéaires et elle est utile pour l'algoritheme de more sorensne
%
% Entrée :
% x : variable de fonction
% n : vecteur de  valeurs des numérateurs
% d : vecteur de  valeurs des dénominateurs
% delta : constante (ça sert à rien dans ce cas)
% flag : indicateur de type de la  fonction
%
% Sorties : la dérive de fi tel que
%       si flag=1  fi = s(l)-delta^2
%       si flag=2  fi = 1/s(l) + 1/(dalta^2)
%           avec s(l)=sum((n(i)^2)/(x+d(i))^2)

    dsum=0;
    for i=1:length(n)
        dsum = dsum - 2*(n(i)^2)/(x+d(i))^3;
    end 
    
    if(flag==1)
        d_fi=dsum;
    elseif(flag==2)
        sum = 0;   
        for i = 1:length(n)
            sum = sum + (n(i)^2)/(x+d(i))^2;
        end

        d_fi = -dsum/sum^2;
    end
    

end
