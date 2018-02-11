function [ h ] = h_f2(x )
    %la hessiane de f2 d'annexe A
    h=[1200 * x(1) ^2 - 400 * x(2) + 2,-400*x(1);
      -400 * x(1),200 ];
end