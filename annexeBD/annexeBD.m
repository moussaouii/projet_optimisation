function [g, H] = annexeBD(num_quad)
    %annexe B et D
    switch num_quad 
        case 1
            g = [ 0 ; 0 ];
            H = [ 7 0 ; 0 2 ];
        case 2 
            g = [ 6 ; 2 ];
            H = [ 7 0 ; 0 2 ];
        case 3
            g = [ -2 ; 1 ];
            H = [ -2 0 ; 0 10 ];
        case 4 
            g = [0 ; 0];
            H = [-2 0 ; 0 10];
        case 5
            g = [2 ; 3];
            H = [4 6 ; 6 5];
        case 6
            g = [2 ; 0];
            H = [4 0 ; 0 -15];
    end