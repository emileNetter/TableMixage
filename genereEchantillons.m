clear global;
close all;

%%Question 1 
N= 11025;
fe=44100;
f0=880;
N_rep=1000;
fct=sin(2*pi*f0/fe*N_v);

x=genereEch(fct,N,fe,f0,N_rep);
soundsc(x,fe+100000);

%%
nbh=4;
note = genereEchPeriod(N,fe,f0,nbh);
genereEch(note,N,fe,f0,N_rep);
soundsc(note,fe);

%%
nbh=0;
note2=genereEchPeriod(N,fe,f0,nbh);
genereEch(note2,N,fe,f0,N_rep);
soundsc(note2,fe);




