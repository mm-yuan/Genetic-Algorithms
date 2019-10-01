% low level function for TSP mutation Swap


function NewChrom = mut_swap(OldChrom,Representation);
NewChrom=OldChrom;

sz = size(OldChrom,2)-1;
pos1 = round(rand*sz + 0.5);
pos2 = round(rand*sz + 0.5);
if pos1 ~= pos2
   if pos1 > pos2
      t = pos1; pos1 = pos2; pos2 = t;
   end
   val1= OldChrom(pos1);
   val2= OldChrom(pos2); 
   NewChrom(pos1) = val2;
   NewChrom(pos2) = val1; 
  
else
   NewChrom = OldChrom;
end






% End of function
