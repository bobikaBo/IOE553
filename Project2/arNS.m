%time series analysis
[~,n]=size(paramNS_);
ar_coefNS=zeros(n,3);
for i=1:n
    ar_coefNS(i,:)=arburg(paramNS_(:,i),2);
end
subplot(2,2,1),plot(paramNS_(:,1)),xlabel('t'),ylabel('parameter beta0');title('parameters in NS model');
subplot(2,2,2),plot(paramNS_(:,2)),xlabel('t'),ylabel('parameter beta1');
subplot(2,2,3),plot(paramNS_(:,3)),xlabel('t'),ylabel('parameter beta2');
subplot(2,2,4),plot(paramNS_(:,4)),xlabel('t'),ylabel('parameter m');