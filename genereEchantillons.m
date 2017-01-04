clear global;
close all;

%%Question 1 
N= 860000;
fe=44100;
f0=880;
N_rep=1000;
N_v=0:N-1;
fct=sin(2*pi*f0/fe*N_v);

x=genereEch(fct,N,fe,N_rep);
soundsc(x,fe+100000);

%% harmoniques
nbh=4;
note = genereEchPeriod(N,fe,f0,nbh);
genereEch(note,N,fe,f0,N_rep);
soundsc(note,fe);

%% fondamental

nbh=0;
note2=genereEchPeriod(N,fe,f0,nbh);
genereEch(note2,N,fe,f0,N_rep);
soundsc(note2,fe);

%%
liste_notes = {'C4','C4','C4','D4','E4','D4','C4','E4', ...
    'D4','D4','C4','D4','D4','D4','D4','A3','B3','D4', ...
    'C4','B3','A3','G3'};
[tab_note]=tab_note_fct();
taille_m=length(liste_notes);
morceau=[];
nbh=4;

for i=1:taille_m
    morceau=[morceau,zeros(1,floor(N/2)),eval(['genereEchPeriod(floor(N/2),tab_note.' liste_notes{i} ',fe,nbh)'])];
end

soundsc(morceau,fe);


%%
fct = fct' .* hamming(length(fct)); % fade in fade out sinuso�de
wvtool(fct);

%%
mozartFinal = LoadFile('mozart');

%% G�n�ration du bruit
mozartBruite = bruiteSignal('Blanc',mozartFinal,100,5);
soundsc(mozartBruite,fe);


