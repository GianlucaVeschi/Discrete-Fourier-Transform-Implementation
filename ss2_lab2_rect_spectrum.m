%--------------------------------------------------------------------------
%title: ss2_lab2_rect_spectrum
%Description:
%	generate and plot a vector containing the sample values of the
%   rectangular at f_s = 8kHz. Plot the amplitude spectrum in the 
%   frequency range [0, f_s/2] 
%Version: 1.2
%Date: 16.05.2018
%Author: Johannah Rosenblum
%--------------------------------------------------------------------------

fs = 32000; % sampling rate of 8kHz
T = 32e-3;  % time window

t = (-T : 1/fs : T); %time window with ts sampling

%rectangle signal
width = 2e-3; % width of rectangle
shift = 1e-3; %rectangle time shift
y = rectpuls(t-shift,width)

% plotting the rect signal
figure();
plot(t,y);
axis([-2e-3 4e-3 0 1.5]) % set axis limit, 4e-3 
title('Rectangular Signal');
ylabel 'y(t)';
xlabel 'time, s';

Y = ss2_lab2_DFT(y); % using custom DFT
%Y = fftshift(fft(y));
abs(Y);

n = length(Y);
t2 = (-n/2:n/2-1)*(fs/n); %vector must be same length as y

figure();
plot(t2,abs(Y));
axis([-4000 4000 0 70 ]) % set axis limit
title('Amplitude spectrum of rectangular signal');
ylabel '|Y(w)|';
xlabel 'Frequency, Hz';
