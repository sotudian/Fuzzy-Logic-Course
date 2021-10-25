%  Shahab Sotudian--94125091
%  Unified Fuzzy Resoning MIMO
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

% Gaussian membership function output 1
for i=1:1:10
 S=0:0.01:100;
 Consequent1(i,:)= exp(-(S- MEANout(1,i)).^2/(2*SIGMAout(1,i)^2));
end
% Gaussian membership function output 2
for i=1:1:10
 S=0:0.01:100;
 Consequent2(i,:)= exp(-(S- MEANout(2,i)).^2/(2*SIGMAout(2,i)^2));
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
    DOF(1,e)=max(w);
    end
  %input 2
    for e=1:10
    for j=1:30001
       w(j)= min(A(2,j),Antecedent2(e,j));
    end
    DOF(2,e)=max(w);
    end
  %input 3
    for e=1:10
    for j=1:30001
       w(j)= min(A(3,j),Antecedent3(e,j));
    end
    DOF(3,e)=max(w);
    end
    % final DOF
    for i=1:10
        Y(1)=DOF(1,i);
        Y(2)=DOF(2,i);
        Y(3)=DOF(3,i);
       DOFfinalmamdani(i)=min(Y) ;
    end
    
     % STEP 1-2
     % output 1
    for e=1:10
    for j=1:10001
       f1mamdani(e,j)= min(DOFfinalmamdani(e),Consequent1(e,j));
    end
    end
     % output 2
      for e=1:10
    for j=1:10001
       f2mamdani(e,j)= min(DOFfinalmamdani(e),Consequent2(e,j));
    end
    end 


% STEP 2 ---- Aggrigation
  % output 1
    for j=1:10001
        for x=1:10
           M1(x)=f1mamdani(x,j);
        end
     AGGRIGATE1mamdani(j)= max(M1);
    end
    % output 2
    for j=1:10001
        for x=1:10
           N1(x)=f2mamdani(x,j);
        end
     AGGRIGATE2mamdani(j)= max(N1);
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
    DOF(1,e)=max(w);
    end
  %input 2
    for e=1:10
    for j=1:30001
       w(j)= min(A(2,j),ComAntecedent2(e,j));
    end
    DOF(2,e)=max(w);
    end
  %input 3
    for e=1:10
    for j=1:30001
       w(j)= min(A(3,j),ComAntecedent3(e,j));
    end
    DOF(3,e)=max(w);
    end
    % final DOF
    for i=1:10
        Y(1)=DOF(1,i);
        Y(2)=DOF(2,i);
        Y(3)=DOF(3,i);
       DOFfinalLogical(i)=min(Y) ;
    end
    
     % STEP 1-2
    % output 1
    for e=1:10
    for j=1:10001
       f1Logical(e,j)= max(DOFfinalLogical(e),Consequent1(e,j));
    end
    end
     % output 2
      for e=1:10
    for j=1:10001
       f2Logical(e,j)= max(DOFfinalLogical(e),Consequent2(e,j));
    end
    end 
       


% STEP 2 ---- Aggrigation
  
    % output 1
    for j=1:10001
        for x=1:10
           M2(x)=f1Logical(x,j);
        end
     AGGRIGATE1Logical(j)= min(M2);
    end
    % output 2
    for j=1:10001
        for x=1:10
           N2(x)=f2Logical(x,j);
        end
     AGGRIGATE2Logical(j)= min(N2);
    end
  %% Unified Aggregation
 for j=1:10001
    UnifiedAGGRIGATE1(j)=Beta*AGGRIGATE1Logical(j)+(1-Beta)*AGGRIGATE1mamdani(j);
 end    
 
 for j=1:10001
    UnifiedAGGRIGATE2(j)=Beta*AGGRIGATE2Logical(j)+(1-Beta)*AGGRIGATE2mamdani(j);
 end 
%% STEP 3 ---- Defuzzification 
Output1=defuzz(S,UnifiedAGGRIGATE1,'centroid')
Output2=defuzz(S,UnifiedAGGRIGATE2,'centroid')
            
        %% Plotting
subplot(3,2,1)
plot(S,AGGRIGATE1Logical,'g','linewidth',2)
title('Output 1')
ylabel('Logical-MIMO')
subplot(3,2,3)
plot(S,AGGRIGATE1mamdani,'m','linewidth',2)
ylabel('Mamdani-MIMO')
subplot(3,2,5)
plot(S,UnifiedAGGRIGATE1,'b','linewidth',2)
ylabel('Unified-MIMO')
 
subplot(3,2,2)
plot(S,AGGRIGATE2Logical,'g','linewidth',2)
title('Output 2')
ylabel('Logical-MIMO')
subplot(3,2,4)
plot(S,AGGRIGATE2mamdani,'m','linewidth',2)
ylabel('Mamdani-MIMO')
subplot(3,2,6)
plot(S,UnifiedAGGRIGATE2,'b','linewidth',2)
ylabel('Unified-MIMO')