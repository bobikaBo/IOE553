function [ price ] = bondVasicek(param, T)
%bondVasicek calculates the vasicek bond price given inputs
%   

  a = param(1);
  b = param(2);
  r = param(3);
  sig = param(4);
  
  B = (1 - exp(-a*T))/a;
  A = (B - T)*(a*b - 0.5*sig^2)/(a^2) - ((sig*B).^2)/(4*a);
  
  price = exp(A - B*r);
  
end

