function [ error ] = errorCIR( param, T, P )
%errorVasicek calculates error for vasicek model

  p_CIR = bondCIR(param, T);
  error = sum((p_CIR - P).^2);
  
end

