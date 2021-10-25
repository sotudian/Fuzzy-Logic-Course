%  Shahab Sotudian--94125091
%  SISO Mamdani
clear;
clc;
SIGMAin=[12.44 20.83 27.98 12.19 16.81 14.45 12.12 17.29 14.49 40.08];
MEANin=[102.07 164.38 201.79 73.79 140.42 122.57 84.65 40.59 55.93 260.03];

SIGMAout=[5.59 9.50 10.02 5.40 7.98 3.17 7.10 6.24 6.20 16.30];
MEANout=[52.38 28.78 65.12 41.32 50.11 66.85 14.01 12.41 35.91 78.74];
y1=cell(10,1);
y2=cell(10,1);
% Gaussian membership function input
for i=1:1:10
 L=0:0.01:300;
 Antecedent(i,:)= exp(-(L - MEANin(i)).^2/(2*SIGMAin(i)^2));
end

% Gaussian membership function output
for i=1:1:10
 S=0:0.01:100;
 Consequent(i,:)= exp(-(S- MEANout(i)).^2/(2*SIGMAout(i)^2));
end


 disp('Please enter the amount of ALK Phosphate')
    h=input('');
    A=gaussmf(L,[15 h]);
   plot(L,A,'b','linewidth',2) 
   axis([0 300 0  1.1]);
    
    %% STEP 1-1
  % evry S-norm evry T-norm
    for e=1:10
    for j=1:30001
       w(j)= min(A(j),Antecedent(e,j));
    end
    DOF(e)=max(w);
    end
      
     %STEP 1-2
    for e=1:10
    for j=1:10001
       f(e,j)= min(DOF(e),Consequent(e,j));
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
Output=defuzz(S,AGGRIGATE,'centroid')
        
       
        
        %% Plotting
        j=1;
        for i=1:10
        subplot(11,2,j)
        plot(L,Antecedent(i,:),'b','linewidth',1.5)
        title(['Input',' -- ','Rule ',num2str(i)])
        j=j+2;
             hold on
        end
        j=2;
        for i=1:10
        subplot(11,2,j)
        plot(S,f(i,:),'k','linewidth',1.5)
       title(['Output',' -- ','Rule ',num2str(i)])
        j=j+2;
             hold on
        end
        subplot(11,2,21)
plot(L,A,'r','linewidth',1.5)
title('Initial Input')
subplot(11,2,22)
plot(S,AGGRIGATE,'g','linewidth',1.5)
title('AGGRIGATE')
