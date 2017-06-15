%% About



%% De Parameters
clc;clear;close all;
nPop=60;
maxIt=1000;
varSize=[1 10];
varRange=[-50,50];
CostFunction=@Goldstein;     % Cost Function
F=.6;
Cr=.6;

%%
people=struct('Position',[],'Cost',[]);

popVector=repmat(people,nPop,1);
mutatedVector=popVector;
targetVector=popVector;

%% initialize
for i=1:nPop
    popVector(i).Position=randi(varRange,varSize);   
    popVector(i).Cost=CostFunction(popVector(i).Position);
    popVector(i).Index=i;%for test
end


%% Main Loop

for it=1:maxIt
    
  
    %Create Mutated vector
%     Mutation(popVector,.7)

    for j=1:nPop
        randomVectorIndex=randi([1 nPop],[2,1]);
        mutatedVector(j).Position= popVector(randomVectorIndex(1)).Position+F*(popVector(j).Position-popVector(randomVectorIndex(2)).Position ); 
        mutatedVector(j).Cost=CostFunction(mutatedVector(j).Position);  
    end
   
    %CrossOver
    targetVector=popVector;
    for j=1:nPop
        j0=randi([1 numel(popVector(1).Position)]);
        for k=1: numel(popVector(1).Position)
            if rand<=Cr || k==j0
              targetVector(j).Position(k)= mutatedVector(j).Position(k);
            end
        end
     targetVector(j).Cost=CostFunction(targetVector(j).Position);  
        if targetVector(j).Cost<popVector(j).Cost
            popVector(j)=targetVector(j);
        end
            
    end
%   minCostIndex=min(popVector(:).Cost)  
 disp(['Iteration ' num2str(it) , ' Best Cost = ' num2str(min([popVector(:).Cost]))]);

    
    
end

