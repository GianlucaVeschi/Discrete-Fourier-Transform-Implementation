%--------------------------------------------------------------------------
%title: ss2_lab2_DFT function
%Description:
%	function takes an arbitrary signal vector y[k] 
%   as its only input argument and that returns the 
%   DFT vector computer according to an equation.
%Version: 1.0
%Date: 12.05.2018
%Auther: Johannah Rosenblum , Gianluca Veschi
%--------------------------------------------------------------------------
function Xk = ss2_lab2_DFT(yk)
N = length(yk);
%Xk = zeros(1,N);   

%for k = (0:N-1) %for loop is slow
%    for n = (0:N-1)
%        Xk(k+1) =Xk(k+1) + yk(n+1)*exp((-1j)*n*k*2*pi/N);
%    end
%end
%redo k from -a to +a
 n = (-N/2:N/2-1); % vector
 e = exp((-1i)*(n.')*n*2*pi/N); % create NxN matrix of exponential factor
 Xk = yk*e; %M1_{1xN} times M2_{NxN} = M3_{1xN}
 
end