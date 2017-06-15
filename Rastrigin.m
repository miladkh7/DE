function z=Rastrigin(x)
    A=10;
    global NFE;
    if isempty(NFE)
        NFE=0;
    end
    NFE=NFE+1;
   z=A*numel(x)+sum(x.^2-A.*cos(2*pi*x));
% summ=0;
%     for i=1:numel(x)
%        term=x(i)^2-2*A*cos(2*pi*x(i));
%        summ=summ+term;
%         
%     end
% z=A*numel(x)+summ;
end
