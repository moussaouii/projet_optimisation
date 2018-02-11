
addpath(genpath('newton_local'));
addpath(genpath('pas_cauchy'));
addpath(genpath('lagrangien'));
addpath(genpath('more_sorensen'));
addpath(genpath('newton_eq_non_lin'));
addpath(genpath('region_confiance'));
%%ce script lance tous les tests de projet






disp('************************************************************************************')
disp('************************************************************************************')
fprintf('\n')
disp('Les tests du projet')
fprintf('\n')
disp('************************************************************************************')
disp('************************************************************************************')
fprintf('\n')
test_newton_local;
fprintf('\n')
disp('************************************************************************************')
fprintf('\n')
test_pas_cauchy;
fprintf('\n')
disp('************************************************************************************')
fprintf('\n')
test_newton_eq_non_lin;
fprintf('\n')
disp('************************************************************************************')
fprintf('\n')
test_more_sorensen;
fprintf('\n')
disp('************************************************************************************')
fprintf('\n')
test_RC;
fprintf('\n')
disp('************************************************************************************')
fprintf('\n')
test_lagrangien;
fprintf('\n')