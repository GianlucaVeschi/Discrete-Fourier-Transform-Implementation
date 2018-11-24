%--------------------------------------------------------------------------
%title: ss2_lab2_DFT_optimization 
%Description:
%	script that compares runtime of ss2_lab2_DFT and MatlabSs fft
%   function using an arbitrary signal of length 10000
%Version: 1.0
%Date: 16.05.2018
%Author: Johannah Rosenblum, Gianluca Veschi
%--------------------------------------------------------------------------
profile on; %profiler keeps track of execution time

yk = (1:1000); % arbitrary vector signal y[k]

% DFT- built in funciton 
tStart = tic; %start stopwatch
f1 = fft(yk);
tEnd_fft = toc(tStart)

% DFT- custom function
t2Start = tic;
f2 = ss2_lab2_DFT(yk);
tEnd_DFT = toc(t2Start)

profile viewer;