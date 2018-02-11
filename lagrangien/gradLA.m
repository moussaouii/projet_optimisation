function gLA = gradLA( g_f , c , g_c , l_k , mu_k , x)

    % Elle retourne la fonction gardiant de lagrangien
    % Entrée :
    %   f : la fonction objectif
    %   c : la fonction condition 
    %   lk : multiplicateur de lagrange
    %   mk : mu


   gLA = g_f(x) + l_k' * g_c(x) + mu_k * g_c(x) * c(x) ;
end