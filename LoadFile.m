function [mozartFinal] = LoadFile( filename )
myFile=eval(['load(''' filename '.mat'')']);

mozart=addToMozart('Instru1',myFile,0);
mozart=addToMozart('Instru1',mozart,44100);
mozart=addToMozart('Instru1',mozart,88200);
mozart=addToMozart('Instru1',mozart,132300);
mozart=addToMozart('Instru1',mozart,176400);
mozart=addToMozart('Instru1',mozart,220500);
mozart=addToMozart('Instru2',mozart,264600);
mozart=addToMozart('Instru3',mozart,308700);
mozart=addToMozart('Instru4',mozart,312800);

mozartFinal = mozart.mozart;
%wvtool(mozartFinal); % sortie graphique amplitude et fréquence

%soundsc(mozartFinal,mozart.fe);
end

