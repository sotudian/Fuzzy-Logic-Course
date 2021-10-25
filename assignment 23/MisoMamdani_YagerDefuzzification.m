%  Shahab Sotudian--94125091
%  MISO Mamdani + Yager defuzzification
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
    disp('Please enter the amount of Alfa in Yager defuzzification method ')
    alfa=input('');
   
    
    %% STEP 1-1
  % evry S-norm evry T-norm
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
       DOFfinal(i)=min(Y) ;
    end
    
     %% STEP 1-2
    for e=1:10
    for j=1:10001
       f(e,j)= min(DOFfinal(e),Consequent(e,j));
    end
     end
       


%% STEP 2 ---- Aggrigation
  
    for j=1:10001
        for x=1:10
           M(x)=f(x,j);
        end
     AGGRIGATE(j)= max(M);
    end
        
%% STEP 3 ---- Defuzzification 
Output=yagerdefuzz(S,AGGRIGATE,alfa)
        
 
       
        
%         %% Plotting
        j=1;
       
        for i=1:10
        subplot(11,4,j)
        plot(L,Antecedent1(i,:),'b','linewidth',1.5)
        if i==1
         title('Input 1: Alk Phosphate ')
        end
        ylabel(['Rule ',num2str(i)])
        axis([0 300 0  1.1]);
        j=j+4;
        
             hold on
        end
        j=2;
        for i=1:10
        subplot(11,4,j)
        plot(L,Antecedent2(i,:),'r','linewidth',1.5)
        if i==1
         title('Input 2: SGOT')
        end
        axis([0 300 0  1.1]);
        j=j+4;
             hold on
        end
        j=3;
        for i=1:10
        subplot(11,4,j)
        plot(L,Antecedent3(i,:),'g','linewidth',1.5)
        if i==1
         title('Input 3: Albumin')
        end
        axis([0 6 0  1.1]);
        j=j+4;
             hold on
        end
        j=4;
         for i=1:10
        subplot(11,4,j)
        plot(S,f(i,:),'k','linewidth',1.5)
        if i==1
         title('Output')
        end
             j=j+4;
             hold on
        end
subplot(11,4,41)        
plot(L,A(1,:),'c','linewidth',1.5) 
title('Initial Input 1')
subplot(11,4,42)        
plot(L,A(2,:),'c','linewidth',1.5) 
title('Initial Input 2')
subplot(11,4,43)        
plot(L,A(3,:),'c','linewidth',1.5) 
title('Initial Input 3')
axis([0 6 0  1.1]);

subplot(11,4,44)
plot(S,AGGRIGATE,'b','linewidth',1.5)
title('AGGRIGATE')
