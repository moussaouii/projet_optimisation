clear all;
close all;
addpath(genpath('../annexeBD'));


% annexeBD(i) retourn les pramètres de la quadratique i de l'annexe B ou D

disp('Tests pas de Cauchy avec l''annexe:B')

disp(' Quadratique1 :')
[g1, H1] = annexeBD(1);
s1 = pas_cauchy(g1, H1, 1);
disp(['   solution s= [' num2str(s1(:).') ']']) 

disp(' Quadratique 2 :')
[g2, H2] = annexeBD(2);
s2 = pas_cauchy(g2, H2, 1);
disp(['   solution s= [' num2str(s2(:).') ']']) 

disp(' Quadratique 3 :')
[g3, H3] = annexeBD(3);
s3 = pas_cauchy(g3, H3, 1);
disp(['   solution s= [' num2str(s3(:).') ']']) 


