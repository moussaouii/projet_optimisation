function [n, d , delta] = annexeC(num_model)
    % annexe C
    switch num_model
        case 1
            n = [ 2 , 6 ];
            d = [ 2 , 14 ];
            delta = 0.5;
        case 2 
            n = [ 2 , 20 ];
            d = [ -38 , 20 ];
            delta= 0.2;
        case 3
            n = [ 2 , 20 ];
            d = [ -38 , 20 ];
            delta= 0.7;
    end
end