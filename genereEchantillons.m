clear global;
close all;

%%Etape 1 : on g�n�re une note on affiche le temporel et frequentiel
N= 11025;
fe=44100;
f0=880;
N_rep=200;
N_v=0:N-1;
fct=sin(2*pi*f0/fe*N_v);

x=genereEch(fct,N,fe,N_rep);
soundsc(x,fe+10000);

%% harmoniques
nbh=24;

note = genereEchPeriod(N,fe,f0,nbh);
genereEch(note,N,fe,N_rep);
soundsc(note,fe);

%% fondamental

nbh=0;
note2=genereEchPeriod(N,fe,f0,nbh);
genereEch(note2,N,fe,N_rep);
soundsc(note2,fe);

%% On g�n�re une m�lodie
fe=44100;
liste_notes = {'C4','C4','C4','D4','E4','D4','C4','E4', ...
    'D4','D4','C4','D4','D4','D4','D4','A3','B3','D4', ...
    'C4','B3','A3','G3'};
[tab_note]=tab_note_fct();
taille_m=length(liste_notes);
morceau=[];
nbh=0;

for i=1:taille_m
    morceau=[morceau,zeros(1,floor(N/2)),eval(['genereEchPeriod(floor(N/2),tab_note.' liste_notes{i} ',fe,nbh)'])];
end

figure,
subplot 211
plot(morceau);
title('Allure temporelle du morceau');
xlabel('Temps (s)');
subplot 212
%spectrogram(morceau);
title('Spectrogramme du morceau');
xlabel('Frequence Hz');
ylabel('db');
soundsc(morceau,fe);
%% Ajout des instruments au morceau
mozartEtComposantes = LoadFile('mozart');
soundsc(mozartEtComposantes,44100);
plot(mozartEtComposantes);

%% Etape 2 : fading in fading out
load('mozart.mat');
fe=44100;
% fct = fct' .* hamming(length(fct)); % fade in fade out sinuso�de � l'aide de hamming
% wvtool(fct);
y1 = fading(mozart,'out',20,fe); %on peut choisir soit in ou out pour le type de fading ainsi que la dur�e 
soundsc(y1,fe);
plot(y1);

%% Etape 3, bruitage
load ('mozart.mat');
mozartBruite = bruiteSignal('Tonal',mozart,5000,15); %on peut choisir entre Tonal et Blanc pour le type de bruit
soundsc(mozartBruite,44100);
%% Etape 4 decalage

load('mozart.mat');
fe=44100;
tau = 2;
g=0.6;
M=1;
k0=floor(tau*fe);

h=fonctionDeTransfert(g,M,k0);
subplot(2,1,1);
%freqz(h,1,1000);
subplot(2,1,2);
%zplane(h,1);

y=filter(h,1,mozart);
plot(y);
soundsc(y,44100);


%% etape 5 effet de reverb
load('mozart.mat');
fe=44100;
tau = 1;
g=0.6;
M=1;
k0=floor(tau*fe);

h=fonctionDeTransfert(g,M,k0);
subplot(2,1,1);
%freqz(1,h,1000);
subplot(2,1,2);
%zplane(h,1);

y=filter(1,h,mozart);
soundsc(y,44100);


