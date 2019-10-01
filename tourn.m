% Syntax:  NewChrIx = tourn(FitnV, Nsel)
%
% Input parameters:
%    FitnV     - Column vector containing the fitness values of the
%                individuals in the population.
%    Nsel      - number of individuals to be selected
%
% Output parameters:
%    NewChrIx  - column vector containing the indexes of the selected
%                individuals relative to the original population, shuffled.
%                The new population, ready for mating, can be obtained
%                by calculating OldChrom(NewChrIx,:).

function NewChrIx = tourn(FitnV,Nsel);
   NewChrIx = 1: Nsel;
   
% Identify the population size (Nind)
   [Nind,ans] = size(FitnV);
% Perform stochastic universal sampling
   for i = 1:Nsel
   tournSize = 30; %%% can be adjusted
   subs = 1 + fix(rand(1,tournSize)*Nind);
   subsFit = FitnV(subs);
   [~,Ind] = sort(subsFit,1,'descend');
   NewChrIx(1) = Ind(1);
   end
   NewChrIx = NewChrIx';

% End of function
