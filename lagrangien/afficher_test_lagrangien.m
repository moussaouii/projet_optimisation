function [] = afficher_test_lagrangien(x_sol, f_sol, l_k, mu_k, nb_iter, flag)
    %afficher les résultats du test de lagrangien augmenté
    
    disp(['             itére final x_sol: [' num2str(x_sol(:).') ']']) 
    disp(['             valeur de f en xsol : ',num2str(f_sol)])
    disp(['             nombre d''iteration : ',num2str(nb_iter)])
    disp(['             multiplicateur de lagrange final : [' num2str(l_k(:).') ']'])
    disp(['             valeur du mu final : ',num2str(mu_k)])
    switch flag
        case 0
          str='convergence ';
        case 1
          str='nombre max d''itération atteint';
       otherwise
          str='Une erreur s’est produite';
    end
    disp(['             deroulement de l’algorithme: ',str])
end

