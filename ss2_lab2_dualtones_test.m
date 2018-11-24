%--------------------------------------------------------------------------
%title: ss2_lab2_dualtones
%Description:
%	this script Play the signal with the function soundsc,
%   then plots the touchtone1.wav file in time and amplitude domain.
%   Also test original number and create plots.
%Version: 1.0
%Date: 16.05.2018
%Author: Johannah Rosenblum, Gianluca Veschi
%--------------------------------------------------------------------------

%Playing the signal:
Path = fullfile('/home/fox/MyFiles/Student/HAW/SignalsSystems2/Lab/Lab2','touchtone1.wav');
[y,freq] = audioread(Path); %y - sampled data vector, fs - sample rate
soundsc(y,freq)

%time-domain
Ts= 1/freq; % sampling period
n = length(y);
t = 0:Ts:(n*Ts-Ts); % end is length of signal *sampleperiod - sample period
figure();
plot(t,y);
axis([0 n*Ts-Ts -1 1]) % set axis limit
title('touchtone1 Time-Domain Plot:');
ylabel 'y(t)';
xlabel 'time, s';

%frequency domain:
Y = fft(y);
n = length(Y);
t2 = (0:n-1)*(freq/n);

figure();
plot(t2,abs(Y));
axis([0 freq 0 2000]) % set axis limit
title('touchtone1 Amplitude Spectrum (over the entire frequency range)');
ylabel '|DFT|, Y(w)';
xlabel 'Frequency, hz';

%testing our own number:
[y, freq] = ss2_lab2_dualtones('0162');
sound(y, freq);

%time-domain
Ts= 1/freq; % sampling period
n = length(y);
t = 0:Ts:(n*Ts-Ts); % end is length of signal *sampleperiod - sample period
figure();
plot(t,y);

axis([0 n*Ts -2 2]) % set axis limit
title('0162 Time-Domain');
ylabel 'y(t)';
xlabel 'time, s';

%frequency domain:
Y = fft(y);
n = length(Y);
t2 = (0:n-1)*(freq/n);

figure();
plot(t2,abs(Y));
title('0162 Amplitude Spectrum');
ylabel '|DFT|, Y(w)';
xlabel 'Frequency, hz';