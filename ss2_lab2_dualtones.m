%--------------------------------------------------------------------------
%title: ss2_lab2_dualtones
%Description:
%	function that takes a vector of digits as its input argument and
%   returns a vector containing the corresponding dual tone signal. 
%   Use the following parameters fs =8kHz,single digit duration 75ms,
%   break duration 30ms
%Version: 1.0
%Date: 16.05.2018
%Author: Johannah Rosenblum, Gianluca Veschi
%--------------------------------------------------------------------------

function [Y, fs] = ss2_lab2_dualtones(digits)

%parameters
fs = 8e3; %8kHz
digitDuration = 75e-3; %total duration of a signle digit
breakDuration = 30e-3; %duration between digits

ts = 1 / fs;
digitVector = 0 : ts : digitDuration - ts; %vector 0:ts:N-1
breakVector = zeros(1, breakDuration / ts); %zero vector
Y = []; %0 by 0 empty matrix

for n = 1 : length(digits) %loop through input digits
    n = digits(n); %current digit
    
    % Column value frequency
    switch n
        case {'1', '4', '7', '*'} 
            f1 = 1209;
        case {'2', '5', '8', '0'}
            f1 = 1336;
        otherwise
            f1 = 1477;
    end
    
    % row value requency
    switch n
        case {'1', '2', '3'} 
            f2 = 697;
        case {'4', '5', '6'}
            f2 = 770;
        case {'7', '8', '9'}
            f2 = 852;
        otherwise
            f2 = 941;
    end
       
    y1 = sin(2*pi*f2*digitVector); %row freq wave
    y2 = sin(2*pi*f1*digitVector); %col freq wave
    Y = [Y y1+y2 breakVector]; % sum of two harmonic waves: previous, sum, break
end

end