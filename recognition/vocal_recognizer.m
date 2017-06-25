clear all
close all

% This script reads a database of vocal cepstrum. Then it records a new
% vocal, obtains the cepstrum and compare with the database calculing the
% distance. The vocal with less distance will be the vocal recorded.

%% READ VOCALS

load a
load e
load i
load o
load u

%% RECORDING A NEW VOCAL
Fs = 16000;
t_record = 1;

% Type of record
y = audiorecorder(Fs,16,1);

% Countdown
for cont = 3:-1:1
    fprintf('%d\n',cont);
    pause(1);
end

% Begining of record
disp('Grabando...');
recordblocking(y,t_record);
disp('...Fin de la grabación');

% Obtainment of sample array
x = getaudiodata(y);

%% CEPSTRUMS OF NEW VOCAL
vocal_fft = fft(x);
Pvocal = vocal_fft.^2/length(vocal_fft);
PvocalLog = 10*log10(Pvocal);
x = ifft(PvocalLog);

%% COMPARING CEPSTRUMS

vocals = ['a' 'e' 'i' 'o' 'u'];
distance = zeros(1,length(vocals));
distance(1) = sum((x(2:13)-a(2:13)).^2);
distance(2) = sum((x(2:13)-e(2:13)).^2);
distance(3) = sum((x(2:13)-i(2:13)).^2);
distance(4) = sum((x(2:13)-o(2:13)).^2);
distance(5) = sum((x(2:13)-u(2:13)).^2);

% Search the minimum distance
[~,pos]=min(distance);
fprintf('\n THE VOCAL IS: %s \n', vocals(pos))