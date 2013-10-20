function [ optimParam, errs ] = optimNS( T, P )

settleD = repmat(datenum('29-Apr-2008'),[3, 1]);
maturity = [addtodate(settleD(1), T(1), 'year'); addtodate(settleD(1), T(2), 'year'); addtodate(settleD(1), T(3), 'year')]; 

couponRate = [0; 0; 0;];
[N, ~] = size(P);

optimParam = zeros(N,4);
errs = zeros(N,1);
%myIROptions = IRFitOptions([0 0 0 0],'UpperBound',[8;15;5;10],'LowerBound',[0;-5;-30;0]);

 for i = 1:N
   i
   instruments = [settleD maturity 100*P(i,:)' couponRate];
   NSModel = IRFunctionCurve.fitNelsonSiegel('Zero', datenum('29-Apr-2008'), instruments,'InstrumentPeriod', [0; 0; 0]);
   optimParam(i,:) = NSModel.Parameters;
   errs(i) = sum((NSModel.getDiscountFactors(maturity) - P(i,:)').^2);
 end

end

