function [ optimParam, errs ] = optimVasicek( T, P )
%optimVasicek calculates optimal values for Vasicek model
%
  
  M = 4;

  [N, ~] = size(P);
  optimParam = zeros(N, M);
  errs = zeros(N,1);
  initParam = [0.1, 0.01, 0.05, 0.01];
  
  options = optimoptions(@fmincon,'Algorithm','interior-point','MaxIter',15000, 'TolFun', 1e-15, 'TolX', 1e-15,'MaxFunEvals', 1000, 'Display', 'off');
  
  for i = 1:N
    optimParam(i,:) = fmincon(@(param) errorVasicek(param, T, P(i,:)),...
      initParam, [], [], [],[], [-0.1; -0.1; -0.1; 0], 0.4*ones(M,1),[], options);
    errs(i) = sum((bondVasicek(optimParam(i,:), T) - P(i,:)).^2);
    %initParam, [], [], [],[], [0; 0; -0.1; 0], 0.4*ones(M,1),[], options);
    %initParam, [], [], [],[], zeros(M,1), 0.4*ones(M,1),[], options);
  end
  

end

