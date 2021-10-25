%  Shahab Sotudian--94125091
%  MISO Mamdani ****  FATI  *****
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
   
    
    %% STEP Aggregation
  % evry T-norm
  %input 1
    for j=1:30001
        for e=1:10
            L1(e)=Antecedent1(e,j);
        end
       w1(j)= min(L1);
    end
    
  %input 2
     for j=1:30001
        for e=1:10
            L2(e)=Antecedent2(e,j);
        end
       w2(j)= min(L2);
     end
    
  %input 3
     for j=1:30001
        for e=1:10
            L3(e)=Antecedent3(e,j);
        end
       w3(j)= min(L3);
     end
    
     %Output
     for j=1:10001
        for e=1:10
            L4(e)=Consequent(e,j);
        end
       C(j)= min(L4);
     end

%%  DOF
%input 1
    for j=1:30001
       D1(j)= min(A(1,j),w1(j));
    end
    DEGREE(1)=max(D1);
%input 2
    for j=1:30001
       D2(j)= min(A(2,j),w2(j));
    end
    DEGREE(2)=max(D2);
%input 3
    for j=1:30001
       D3(j)= min(A(3,j),w3(j));
    end
    DEGREE(3)=max(D3);
%    DOF final
DOF=min(DEGREE);
%%  Infer
    for j=1:10001
       OUT(j)= min(DOF,C(j));
    end
    
     %% Defuzzification
     Output=defuzz(S,OUT,'centroid')
  %% Plotting
  subplot(2,4,1)        
plot(L,w1,'b','linewidth',1.5) 
title('Aggregation of Input 1')
axis([0 150 0  max(w1)+0.1]);
subplot(2,4,2)        
plot(L,w2,'g','linewidth',1.5) 
title('Aggregation of Input 2')
axis([0 150 0  max(w2)+0.1]);
subplot(2,4,3)        
plot(L,w3,'k','linewidth',1.5) 
title('Aggregation of Input 3')
axis([0 6 0  max(w3)+0.1]);
subplot(2,4,4)        
plot(S,C,'r','linewidth',1.5) 
title('Aggregation of Output')
axis([0 100 0  max(C)+0.1]);
subplot(2,4,5)
plot(L,A(1,:),'c','linewidth',1.5) 
title('Initial Input 1')
subplot(2,4,6)        
plot(L,A(2,:),'c','linewidth',1.5) 
title('Initial Input 2')
subplot(2,4,7)        
plot(L,A(3,:),'c','linewidth',1.5) 
title('Initial Input 3')
axis([0 6 0  1.1]);
subplot(2,4,8)  
plot(S,OUT,'m','linewidth',1.5)
title('Final Output')

     