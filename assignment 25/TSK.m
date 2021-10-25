%  Shahab Sotudian--94125091
%  TSk modeling
clear;
clc;
load('MEANin.mat');
load('SIGMAin.mat');
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


    disp('Please enter the amount of ALK Phosphate (0 < A < 300)')
    h1=input('');
    disp('Please enter the amount of Albumin (2.5 < B < 6)')
    h2=input('');
    
    % TSK
    %% STEP 1  Degree of fire for each Rule
%   input 1
    for e=1:10
        b1=find(L==h1);
    w1(e)=Antecedent1(e,b1);
    end
 %   input 2
    for e=1:10
        b2=find(L==h2);
    w2(e)=Antecedent2(e,b2);
    end
%     final DOF
    for i=1:10
        Y(1)=w1(i);
        Y(2)=w2(i);
        DOF(i)=min(Y) ;
    end
    
    
     %% STEP 2   Crisp output for each rule
     A=h1;
     B=h2;
Z(1) = 2*A + 30*B + 10;
Z(2) = 1.5*A + 25*B + 3;
Z(3) = 0.5*A + 42*B + 6;
Z(4) = 3*A + 26*B + 2;
Z(5) = 3.2*A + 13*B + 25;
Z(6) = 2.4*A + 21*B + 13;
Z(7) = 5*A + 51*B + 2;
Z(8) = 0.1*A + 13*B + 41;
Z(9) = 7*A + 24*B + 9;
Z(10) = 0.4*A + 37*B + 16;
       


%% STEP 3   Final Output
S=0;
W=0;
  for e=1:10
      S=S+Z(i)*DOF(i);
      W=W+DOF(i);
  end
  Output=S/W
  
       
        
        %% Plotting
        j=1;
       
        for i=1:10
        subplot(11,3,j)
        plot(L,Antecedent1(i,:),'b','linewidth',2)
        if i==1
         title('Input 1: Alk Phosphate ')
        end
        ylabel(['Rule ',num2str(i)])
        axis([0 300 0  1.1]);
        j=j+3;
        
             hold on
        end
        j=2;
        for i=1:10
        subplot(11,3,j)
        plot(L,Antecedent2(i,:),'g','linewidth',2)
        if i==1
         title('Input 2: Albumin')
        end
        axis([2.5 5 0  1.1]);
        j=j+3;
             hold on
        end
      
        j=3;
        for i=1:10
        subplot(11,3,j)
        plot(Z(i),0.1,'k*','linewidth',10)
        axis tight
        if i==1
         title('Output')
        end
        j=j+3;
             hold on
        end
        
        subplot(11,3,33)
        plot(Output,0.1,'r*','linewidth',10)
        axis tight
        title('Final Output')
       