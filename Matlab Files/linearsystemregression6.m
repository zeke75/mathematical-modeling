%LINEARSYSTEMREGRESSION6: MATLAB script M-file for analyzing the 
%data stored in linearsystemregressiondata, scaling data
%Analyzes standardized residuals
load linearsystemregressiondata
F1 = [ones(size(y1)) x1 x2 zeros(size(y1)) zeros(size(y1))];
F2 = [zeros(size(y1)) x2 zeros(size(y1)) ones(size(y1)) x1];
w1 = std(y1);
w2 = std(y2);
z = [y1/w1;y2/w2];
F = [F1/w1;F2/w2];
p = F\z;
%Standardized residuals
M=F*((F'*F)\F');
q = 2*length(y1)-length(p);    
s = sqrt(norm(z-F*p)^2/q);
r = (z-F*p)./(s*sqrt(1-diag(M)));
l = stut(q,.68)
%Predictions. NOTE: Plotting against SCALED predictions
pr = F*p;   %All first components first, then all second
plot(pr,r,'o',pr,-l*ones([1 length(pr)]),'r',pr,l*ones([1 length(pr)]),'r');
title('Standardized residuals vs. Predictions','FontSize',15)
xlabel('Predictions')
ylabel('Standardized residuals r_k')
dex=0;
for j=1:length(r)
    if abs(r(j)) <= l
        dex=dex+1;
    end
end
dex
ratio = dex/(2*length(y1))