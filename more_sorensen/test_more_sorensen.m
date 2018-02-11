addpath(genpath('../annexeBD'));
tol = 1e-6;
delta = 1;

disp('Test algorithme de Moré Sorensen avec l''annexe:B et D')
disp('    -Quadratique 1')
[g, H] = annexeBD(1);
[s,l,d,flag] = more_sorensen(g, H, delta,tol);
[s_et,dec_et, l_et,~] = etalonms(g, H, delta,tol) ;
disp(['         Resultat avec algorithme de Moré Sorensen s=[' num2str(s(:).') '], l=',num2str(l),' , decroissance=' ,num2str(d),', flag= ',disp_flag(flag)])
disp(['         Resultat code etalons s=[' num2str(s_et(:).') '], l=',num2str(l_et),', decroissance=',num2str(dec_et)])

disp('    -Quadratique 2')
[g, H] = annexeBD(2);
[s,l,d,flag] = more_sorensen(g, H, delta,tol);
[s_et,dec_et, l_et,~] = etalonms(g, H, delta,tol) ;
disp(['         Resultat avec algorithme de Moré Sorensen s=[' num2str(s(:).') '], l=',num2str(l),' , decroissance=' ,num2str(d),', flag= ',disp_flag(flag)])
disp(['         Resultat code etalons s=[' num2str(s_et(:).') '], l=',num2str(l_et),', decroissance=',num2str(dec_et)])

disp('    -Quadratique 3')
[g, H] = annexeBD(3);
[s,l,d,flag] = more_sorensen(g, H, delta,tol);
[s_et,dec_et, l_et,~] = etalonms(g, H, delta,tol) ;
disp(['         Resultat avec algorithme de Moré Sorensen s=[' num2str(s(:).') '], l=',num2str(l),' , decroissance=' ,num2str(d),', flag= ',disp_flag(flag)])
disp(['         Resultat code etalons s=[' num2str(s_et(:).') '], l=',num2str(l_et),', decroissance=',num2str(dec_et)])

disp('    -Quadratique 4')
[g, H] = annexeBD(4);
[s,l,d,flag] = more_sorensen(g, H, delta,tol);
[s_et,dec_et, l_et,~] = etalonms(g, H, delta,tol) ;
disp(['         Resultat avec algorithme de Moré Sorensen s=[' num2str(s(:).') '], l=',num2str(l),' , decroissance=' ,num2str(d),', flag= ',disp_flag(flag)])
disp(['         Resultat code etalons s=[' num2str(s_et(:).') '], l=',num2str(l_et),', decroissance=',num2str(dec_et)])

disp('    -Quadratique 4')
[g, H] = annexeBD(5);
[s,l,d,flag] = more_sorensen(g, H, delta,tol);
[s_et,dec_et, l_et,~] = etalonms(g, H, delta,tol) ;
disp(['         Resultat avec algorithme de Moré Sorensen s=[' num2str(s(:).') '], l=',num2str(l),' , decroissance=' ,num2str(d),', flag= ',disp_flag(flag)])
disp(['         Resultat code etalons s=[' num2str(s_et(:).') '], l=',num2str(l_et),', decroissance=',num2str(dec_et)])

disp('    -Quadratique 6')
[g, H] = annexeBD(6);
[s,l,d,flag] = more_sorensen(g, H, delta,tol);
[s_et,dec_et, l_et,~] = etalonms(g, H, delta,tol) ;

disp(['         Resultat avec algorithme de Moré Sorensen s=[' num2str(s(:).') '], l=',num2str(l),' , decroissance=' ,num2str(d),', flag= ',disp_flag(flag)]);
disp(['         Resultat code etalons s=[' num2str(s_et(:).') '], l=',num2str(l_et),', decroissance=',num2str(dec_et)]);


function s=disp_flag(flag)
    switch flag
        case 1
            s='solution intérieure';
        case 2
            s='solution sur la frontière et q1 * g'' != 0';
        case 3
            s='solution sur la frontière et q1 * g'' = 0 et norm(s_(λ1)) > delta';
        case 4
            s='solution sur la frontière cas difficile';
        otherwise
            s='Une erreur s’est produite';
    end
end
