function run_ga_modified(x, y, NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT,CROSSOVER, LOCALLOOP, ah1, ah2, ah3,MUTATION,SELECTION,MULTIPLEPARENTS)
{NIND MAXGEN NVAR ELITIST STOP_PERCENTAGE PR_CROSS PR_MUT CROSSOVER LOCALLOOP}
warning('off','all')
%%%%
MUTATION = 'mut_swap';  % 'mut_insertion','mut_swap', 'mut_inversion'
%%%%

GGAP = 1 - ELITIST;
mean_fits=zeros(1,MAXGEN+1);
worst=zeros(1,MAXGEN+1);
Dist=zeros(NVAR,NVAR);
for  i=1:size(x,1)
for  j=1:size(y,1)
     Dist(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
end
end
% initialize population
Chrom=zeros(NIND,NVAR);
for  row=1:NIND
%Chrom(row,:)=path2adj(randperm(NVAR)); %Adjency Representation
Chrom(row,:)=randperm(NVAR); % Path representaion
end
gen=0;
% number of individuals of equal fitness needed to stop
stopN=ceil(STOP_PERCENTAGE*NIND);
% evaluate initial population
ObjV = tspfun(Chrom,Dist);
best=zeros(1,MAXGEN);
% generational loop
while  gen<MAXGEN 
sObjV=sort(ObjV);
best(gen+1)=min(ObjV);
minimum=best(gen+1);
mean_fits(gen+1)=mean(ObjV);
worst(gen+1)=max(ObjV);
for  t=1:size(ObjV,1)
if  (ObjV(t)==minimum)
break ;
end
end
if  (rem(gen,10)==9)
%visualizeTSP(x,y,adj2path(Chrom(t,:)), minimum, ah1, gen, best, mean_fits, worst,
%ah2, ObjV, NIND, ah3); %Adjency representation
visualizeTSP(x,y,Chrom(t,:), minimum, ah1, gen, best, mean_fits, worst, ah2, ObjV,NIND, ah3);
end
if  (sObjV(stopN)-sObjV(1) <= 1e-15)
break ;
elseif (gen>100)
if (best(gen-50)-best(gen+1)<=0.0001*best(gen-50))
break ;
end
end
%assign fitness values to entire population
FitnV=ranking(ObjV);   %FitnV=scaling(ObjV); or ranking()

%select individuals for breeding
SelCh=select('sus', Chrom, FitnV, GGAP); %%% 'sus', 'rws', 'tourn'

%recombine individuals (crossover)
SelCh = recombin(CROSSOVER,SelCh,PR_CROSS);
%mutate individuals (mutation)
SelCh=mutateTSP(MUTATION,SelCh,PR_MUT);
%evaluate offspring, call objective function
ObjVSel = tspfun(SelCh,Dist);
%reinsert offspring into population
[Chrom ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
Chrom = tsp_ImprovePopulation(NIND, NVAR, Chrom,LOCALLOOP,Dist);
%increment generation counter
gen=gen+1;
end
end