% low level function for TSP mutation inversion


function NewChrom = mut_insertion(OldChrom,Representation);
NewChrom=OldChrom;

sz = size(NewChrom,2)-1;
pos1 = round(rand*sz + 0.5);
pos2 = round(rand*sz + 0.5);
if pos1 ~= pos2
   if pos1 > pos2
      t = pos1; pos1 = pos2; pos2 = t;
   end
   NewChrom = [OldChrom(1:pos1) OldChrom(pos2) OldChrom(pos1+1:pos2-1) OldChrom(pos2+1:sz+1)];
else
   NewChrom = OldChrom;
end






% End of function
