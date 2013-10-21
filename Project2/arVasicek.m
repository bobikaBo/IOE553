%time series analysis to V model
[~,n]=size(paramV);
ar_coefV=zeros(n,3);
for i=1:n
    ar_coefV(i,:)=arburg(paramV(:,i),2);
end
subplot(2,2,1),plot(paramV(:,1)),xlabel('t'),ylabel('parameter a');title('parameters in Vasieck model');
subplot(2,2,2),plot(paramV(:,2)),xlabel('t'),ylabel('parameter b');
subplot(2,2,3),plot(paramV(:,3)),xlabel('t'),ylabel('parameter r');
subplot(2,2,4),plot(paramV(:,4)),xlabel('t'),ylabel('parameter sig');