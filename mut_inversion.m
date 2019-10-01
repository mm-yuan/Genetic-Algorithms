% low level function for TSP mutation inversion


function NewChrom = mut_inversion(OldChrom,Representation);
NewChrom=OldChrom;

sz = size(OldChrom,2)-1;
pos1 = round(rand*sz + 0.5);
pos2 = round(rand*sz + 0.5);
if pos1 ~= pos2
   if pos1 > pos2
      t = pos1; pos1 = pos2; pos2 = t;
   end
   if (pos1 ~= 1 &&  pos2 ~= sz +1 )
   NewChrom = [OldChrom(1:pos1-1) fliplr(OldChrom(pos1:pos2)) OldChrom(pos2+1:(sz+1))];
   end
else
   NewChrom = OldChrom;
end






% End of function
