clear global;
close all;

%%Question 1 

x=genereEch(11025,44100,880,1000);
soundsc(x,fe+100000);

%%

note = genereEchPeriod(11025,44100,880,0);




