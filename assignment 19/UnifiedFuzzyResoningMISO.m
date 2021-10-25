%  Shahab Sotudian--94125091
%  Unified Fuzzy Resoning MISO
clear;
clc;
load('MEANin.mat');
load('SIGMAin.mat');
load('MEANout.mat');
load('SIGMAout.mat');
% Gaussian membership function input 1
for i=1:1:10
 L=0:0.01:300;
 Antecedent1(i,:)= exp(-(L - MEANin(1,i)).^2/(2*SIGMAin(1,i)^2));
end
% Gaussian membership function input 2
for i=1:1:10
 L=0:0.01:300;
 Antecedent2(i,:)= exp(-(L - MEANin(2,i)).^2/(2*SIGMAin(2,i)^2));
end
% Gaussian membership function input 3
for i=1:1:10
 L=0:0.01:300;
 Antecedent3(i,:)= exp(-(L - MEANin(3,i)).^2/(2*SIGMAin(3,i)^2));
end

% Gaussian membership function output
for i=1:1:10
 S=0:0.01:100;
 Consequent(i,:)= exp(-(S- MEANout(i)).^2/(2*SIGMAout(i)^2));
end


    disp('Please enter the amount of ALK Phosphate')
    h1=input('');
    A(1,:)=gaussmf(L,[15 h1]);
    disp('Please enter the amount of SGOT')
    h2=input('');
    A(2,:)=gaussmf(L,[20 h2]);
    disp('Please enter the amount of Albumin')
    h3=input('');
    A(3,:)=gaussmf(L,[0.2 h3]);
    disp('Please enter the amount of Beta(0<= Beta <=1)')
    Beta=input('');
    
    %%     ********  MAMDANI PART  *******
    % STEP 1-1
    %input 1
    for e=1:10
    for j=1:30001
       w(j)= min(A(1,j),Antecedent1(e,j));
    end
    DOFmamdani(1,e)=max(w);
    end
  %input 2
    for e=1:10
    for j=1:30001
       w(j)= min(A(2,j),Antecedent2(e,j));
    end
    DOFmamdani(2,e)=max(w);
    end
  %input 3
    for e=1:10
    for j=1:30001
       w(j)= min(A(3,j),Antecedent3(e,j));
    end
    DOFmamdani(3,e)=max(w);
    end
    % final DOF
    for i=1:10
        Y(1)=DOFmamdani(1,i);
        Y(2)=DOFmamdani(2,i);
        Y(3)=DOFmamdani(3,i);
       DOFfinalmamdani(i)=min(Y) ;
    end
  
     % STEP 1-2
    for e=1:10
    for j=1:10001
       fmamdani(e,j)= min(DOFfinalmamdani(e),Consequent(e,j));
    end
     end
 % STEP 2 ---- Aggrigation
  
    for j=1:10001
        for x=1:10
           M(x)=fmamdani(x,j);
        end
     AGGRIGATEmamdani(j)= max(M);
    end
    
    
    %%     ********  Logical PART  *******
    % STEP 1-1
    % compelemnt of Antecedents
                  for d=1:10
                 ComAntecedent1(d,:)=1-Antecedent1(d,:);
                 ComAntecedent2(d,:)=1-Antecedent2(d,:);
                 ComAntecedent3(d,:)=1-Antecedent3(d,:);
                  end 
  %input 1
    for e=1:10
    for j=1:30001
       w(j)= min(A(1,j),ComAntecedent1(e,j));
    end
    DOFLogical(1,e)=max(w);
    end
  %input 2
    for e=1:10
    for j=1:30001
       w(j)= min(A(2,j),ComAntecedent2(e,j));
    end
    DOFLogical(2,e)=max(w);
    end
  %input 3
    for e=1:10
    for j=1:30001
       w(j)= min(A(3,j),ComAntecedent3(e,j));
    end
    DOFLogical(3,e)=max(w);
    end
    % final DOF
    for i=1:10
        Y(1)=DOFLogical(1,i);
        Y(2)=DOFLogical(2,i);
        Y(3)=DOFLogical(3,i);
       DOFfinalLogical(i)=min(Y) ;
    end
   
     % STEP 1-2
    for e=1:10
    for j=1:10001
       f(e,j)= max(DOFfinalLogical(e),Consequent(e,j));
    end
     end
 % STEP 2 ---- Aggrigation
  
    for j=1:10001
        for x=1:10
           M(x)=f(x,j);
        end
     AGGRIGATELogical(j)= min(M);
    end   
  %% Unified Aggregation
 for j=1:10001
    UnifiedAGGRIGATE(j)=Beta*AGGRIGATELogical(j)+(1-Beta)*AGGRIGATEmamdani(j);
 end    
%% STEP 3 ---- Defuzzification 
Output=defuzz(S,UnifiedAGGRIGATE,'centroid')
            
        %% Plotting
subplot(3,1,1)
plot(S,AGGRIGATELogical,'g','linewidth',2)
title('Logical Method - MISO')
subplot(3,1,2)
plot(S,AGGRIGATEmamdani,'m','linewidth',2)
title('Mamdani Method - MISO')
subplot(3,1,3)
plot(S,UnifiedAGGRIGATE,'b','linewidth',2)
title(['Unified Method - MISO','          Beta= ',num2str(Beta)])
 
