function [morceau] = melodie(N)
liste_notes = ['C4','C4','C4','D4','E4','D4','C4','E4'...
    'D4','D4','C4,','D4','D4','D4','D4','A3','B3','D4'...
    'C4','B3','A3','G3'];
[tab_note]=tab_note_fct();
taille_m=length(liste_notes);
morceau=[];
nbh=4;

for i=1:taille_m
    morceau=[morceau,zeros(1,floor(N/2)),...
        eval(['genereEchPeriod(tab_note.' liste_notes{i} ',floor(N/2),f0,fe, nbh)'])];
end


end

