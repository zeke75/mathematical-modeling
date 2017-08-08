function value = stut(q,p)
%STUT: MATLAB function M-file that takes as input degrees
%of freedom q and a probability goal p, and returns 
%the value l so that a random variable T with 
%student's t distribution t_q will be in the range
%-l to l with probability p.
%
%If q is too large (q > 341), MATLAB cannot handle the 
%large gamma function value, and we use a Gaussian approximation.
%See gtc.m for more on approximating the student's t
%distribution with a Gaussian.  In this case we always 
%get l = 1.9600 for a .95 confidence interval, but the 
%code is general for other cases.
if q < 342
    f=@(x) (gamma((q+1)/2)/(gamma(q/2)*sqrt(q*pi)))./(1+x.^2/q).^((q+1)/2);
    residue = @(l) quad(f,-l,l)-p;
    value=fzero(residue,1);
else
    f=@(x) exp(-x.^2/2)/sqrt(2*pi);
    residue = @(l) quad(f,-l,l)-p;
    value=fzero(residue,1);
end
    
