%time series analysis
[~,n]=size(paramC);
ar_coefCIR=zeros(n,3);
for i=1:n
    ar_coefCIR(i,:)=arburg(paramC(:,i),2);
end
subplot(2,2,1),plot(paramC(:,1)),xlabel('t'),ylabel('parameter a');title('parameters in CIR model');
subplot(2,2,2),plot(paramC(:,2)),xlabel('t'),ylabel('parameter b');
subplot(2,2,3),plot(paramC(:,3)),xlabel('t'),ylabel('parameter r');
subplot(2,2,4),plot(paramC(:,4)),xlabel('t'),ylabel('parameter sig');