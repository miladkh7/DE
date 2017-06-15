function z=Goldstein(X)
%% function Shape
    % [x,y] = meshgrid(-2:.1:2, -2:.1:2);
    % z=(1+(19-14.*x+3.*x.^2-14.*y+6.*x.*y+3.*y.^2).*(x+y+1).^2).*(30+(18-32.*x+12.*x.^2+48.*y-36.*x.*y+27.*y.^2).*(2.*x - 3.*y).^2);
    % surf(x,y,z)
    global NFE;
    if isempty(NFE)
        NFE=0;
    end
    NFE=NFE+1;
    x=X(1);
    y=X(2);
    z=(1+(19-14*x+3*x^2-14*y+6*x*y+3*y^2)*(x+y+1)^2)*(30+(18-32*x+12*x^2+48*y-36*x*y+27*y^2)*(2*x - 3*y)^2);
end