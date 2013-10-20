function [ price ] = bondCIR(param, T)
%bondCIR calculates the vasicek bond price given inputs
%   

  a = param(1);
  b = param(2);
  r = param(3);
  sig = param(4);
  gam = sqrt(a^2 + 2*sig^2);
  
  egt = exp(gam*T);
  
  B = 2*(egt - 1) ./ ((gam + a)*(egt - 1) + 2*gam);
  A = (2*gam*exp((a + gam)*(T/2)) ./ ((gam + a)*(egt - 1) + 2*gam)).^(2*a*b/(sig^2));
  
  price = A .* exp(-B*r);
  
end

