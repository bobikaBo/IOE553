close all;
clc;
clear;

load results;
%load data;

tic
%[paramV, errsV] = optimVasicek(T,zprices);
toc

tic
%[paramC, errsC] = optimCIR(T,zprices);
toc

tic
%[paramNS, errsNS] = optimNS(T,zprices);
toc

figure
plot(dates, 100*zprices);
datetick('x')
xlabel('Date')
ylabel('Price')
title('Bond Price Evolution')
legend('2Y','5Y','10Y', 'Location','Best')

figure
plot(dates,errsV/3)
hold on
plot(dates,errsC/3,'r')
plot(dates,errsNS/3,'k')
datetick('x')
xlabel('Date')
ylabel('Error')
title('Mean Squared Error')
legend('Vasicek','CIR','NS','Location','Best')

meanErrorV = mean(errsV/3)
meanErrorCIR = mean(errsC/3)

figure
plot(dates, paramV(:,3))
hold on;
plot(dates, paramC(:,3),'r')
plot(dates, rON/100,'k')
datetick('x')
hold off
xlabel('Date')
ylabel('r(0)')
title('Short Rate Evolution')
legend('Vasicek','CIR','Market O/N', 'Location','Best')

figure
plot(dates, paramV(:,4))
hold on;
plot(dates, paramC(:,4).*sqrt(paramC(:,3)),'r')
datetick('x')
hold off
xlabel('Date')
ylabel('Sigma')
title('Volatility Evolution')
legend('Vasicek','CIR', 'Location','Best')

figure
plot(dates, paramV(:,2)./paramV(:,1))
hold on;
plot(dates, paramC(:,2),'r')
datetick('x')
hold off
xlabel('Date')
ylabel('Long Term Rate')
title('Long Term Rate Evolution')
legend('Vasicek','CIR', 'Location','Best')

figure;
paramNS_ = paramNS;
for j = 1:4
  for i = 2:2027
    if (abs(paramNS_(i,j)-paramNS_(i-1,j))>10)
      paramNS_(i,j) = paramNS_(i-1,j);
    end
  end
  subplot(2,2,j);
  plot(dates,paramNS_(:,j));
  datetick('x')
  xlabel('Date')
end

