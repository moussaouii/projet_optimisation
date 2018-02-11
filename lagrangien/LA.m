function L = LA(f,c,l_k,mu_k,x)
    % Elle retourne la fonction lagrangien
    % Entrée :
    %   f : la fonction objective
    %   c : la fonction condition 
    %   lk : multiplicateur de lagrange
    %   mk : mu
    L = f(x) + l_k'*c(x) + (mu_k/2)*(norm(c(x))^2);
end
