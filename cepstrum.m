clear all
close all

% This scrpit reads a database of the same vocal, then it obtains the 
% cepstrum of each signal and get the mean.

%% READ FILES

% Choose the directory of the database
files = dir('D:\mblupi\Dropbox\proyectos\Vocales\i');

vocal_ceps = [];

% There are two empty files
for i = 1:length(files)-2
    
    % Load the file
    vocal = load(files(i+2).name);
    
    % Get the vector of samples
    x = vocal.audio;
    
    % Cepstrum
    vocal_fft = fft(x);
    Pvocal = vocal_fft.^2/length(vocal_fft);
    PvocalLog = 10*log10(Pvocal);
    ceps = ifft(PvocalLog);
    % Concatenate all cepstrum
    vocal_ceps = [vocal_ceps ceps];
end

% Get the mean of ceptrums
media = mean(vocal_ceps');
i = media';

% Save the mean
cd('D:\mblupi\Dropbox\proyectos\Vocales\cepstrum')
save('i.mat', 'i');