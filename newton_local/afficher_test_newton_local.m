function [] = afficher_test_newton_local(x_sol,f_sol,nb_itr,flag)
    %affichage des résultats de tests de newton local
    disp(['             itére final x_sol: [' num2str(x_sol(:).') ']']) 
    disp(['             valeur de f en xsol : ',num2str(f_sol)])
    disp(['             nombre d''iteration : ',num2str(nb_itr)])
    switch flag
        case 0
          str='convergence ';
        case 1
          str='Distance entre les itérés trop faible pour poursuivre';
        case 2
          str='Distance entre les f(itéres) trop faibles pour poursuivre';
        case 3
          str='nombre max d''itération atteint';
       otherwise
          str='Une erreur s’est produite';
    end
    disp(['             deroulement de l’algorithme: ',str])
end

