clear all
close all

% This script records vocals and then saves them choosing the vocal you
% have recorded and the number of the record. The point is getting easily a
% database of vocals. The sampling frecuency is 16KHz with 16 bits to
% represent the signal. After a countdown, this script records during 1
% second.

%% GETTING AUDIO SAMPLES
% Vocal and number of sample
num_sample = 7;
vocal = 'u';

Fs = 16000;
t_record = 1;

% Define parameters of recording
x = audiorecorder(Fs,16,1);

% Countdown
for cont = 3:-1:1
    fprintf('%d\n',cont);
    pause(1);
end

% Beging of the record
disp('Grabando...');
recordblocking(x,t_record);
disp('...Fin de la grabación');

% Getting array of samples
audio = getaudiodata(x);

%% SAVE THE SINGAL
cd('D:\mblupi\Dropbox\proyectos\Vocales\u')
name = [vocal, num2str(num_sample)];
save(name,'audio');