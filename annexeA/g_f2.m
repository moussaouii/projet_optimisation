function [ g ] = g_f2(x )
    % gradiant fonction f2 d'annexe A
    g=[-400*(x(2)-x(1)^2)*x(1)-2*(1-x(1)) ; 200*(x(2)-x(1)^2)];
end

