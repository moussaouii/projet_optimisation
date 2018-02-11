function hLA = hessLA(  h_f , h_c , c , g_c , l_k , mu_k , x)
    % Elle retourne la fonction hessienne de lagrangien
    % Entrée :
    %   f : la fonction objectif
    %   c : la fonction condition 
    %   lk : multiplicateur de lagrange
    %   mk : mu


    hLA= h_f(x) + h_c(x)*(l_k + mu_k*c(x)) + mu_k*g_c(x)*g_c(x)';   
end