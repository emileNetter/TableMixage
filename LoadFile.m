function [] = LoadFile( filename )
%LOADFILE Summary of this function goes here
%   Detailed explanation goes here
myFile=eval(['load(''' filename '.mat'')']);
mylength=length(eval(['myFile.' filename]));

N_v = 0:mylength-1;
Nfft = 256;

% file=eval(['myFile.' filename]);
% figure, 
% subplot 211
% %représentation temporelle
% plot(N_v,file);
% xlim([0 5000-1]); %limite valeurs de x
% xlabel('Numéro échantillon');
% ylabel('s(t)');

% subplot 212
% var=256;
% spectrogram(file,rectwin(var),var/2,Nfft,myFile.fe,'yaxis');


mozart=addToMozart('Instru1',myFile,0);
mozart=addToMozart('Instru1',mozart,44100);
mozart=addToMozart('Instru1',mozart,88200);
mozart=addToMozart('Instru1',mozart,132300);
mozart=addToMozart('Instru1',mozart,176400);
mozart=addToMozart('Instru1',mozart,220500);
mozart=addToMozart('Instru2',mozart,264600);
mozart=addToMozart('Instru3',mozart,308700);
mozart=addToMozart('Instru4',mozart,312800);

res = mozart.mozart .* hamming(length(mozart.mozart));
wvtool(res);

soundsc(res,mozart.fe);
end

