function [ error ] = errorVasicek( param, T, P )
%errorVasicek calculates error for vasicek model

  p_vasicek = bondVasicek(param, T);
  error = sum((p_vasicek - P).^2);
  
end

