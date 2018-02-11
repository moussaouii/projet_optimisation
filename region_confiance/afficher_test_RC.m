function [] = afficher_test_RC(x_sol,ng_sol,f_sol,nb_itr,flag,d)
    % afficher les résultats du test de région de confiance
    disp(['             itére final x_sol: [' num2str(x_sol(:).') ']']) 
    disp(['             norme du gradient en xsol : ',num2str(ng_sol)])
    disp(['             valeur de f en xsol : ',num2str(f_sol)])
    disp(['             nombre d''iteration : ',num2str(nb_itr)])
    disp(['             la décroissance obtenue : ',num2str(d)])
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

