%--------------------------------------------------------------------------
%title: ss2_problem1 function
%Description:
%	function has one input parameter n which controlls the sampling frequency. 
%   The function generates a plot containing two subplots.
%Version: 1.0
%Date: 18.04.2018
%Auther: Johannah Rosenblum, Gianluca Veschi
%--------------------------------------------------------------------------
function ss2_problem1(n) %(a)

%original signal
T = 0.0025; %temporal resolution
t1 =( 0.0025 : T: 1); %interval 
x = 4*sin(2*pi*t1) + cos(pi/4+16*pi*t1);

%Sampling the original signal
Ts = T*n; %sample period
t2 = ( 0.0025 : Ts: 1); %sampling interval
xk = 4*sin(2*pi*t2) + cos(pi/4+16*pi*t2); %sampled signal
%xk = downsample(x,n); %sampled signal

%Reconstruction
xt = 0;
for k = 1:length(xk)
    xt = xt + xk(k)*sinc((t1-(k-1)*Ts) / Ts);
end

%Plotting
figure

subplot(2,1,1)      % add first plot in 2 x 1 grid
plot(t1,x,'m',t2,xk, 'c*') % problem (b) and (c), plotting orginal and sampled signal
title("Signal x(t) with Marked Samples")
xlabel('time (s)')
ylabel('Amplitude')
legend('original', 'samples')

subplot(2,1,2)       % add second plot in 2 x 1 grid
plot(t1,xt, t1,x,'r--')    
axis([0 1 -5 5])    % set axis limit
title('Reconstructed Signal and Original Signal')
xlabel('time (s)')
ylabel('Amplitude')
legend('Reconstructed', 'original')

end %end of function

