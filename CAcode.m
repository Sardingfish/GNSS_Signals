% *************************************************************************
% CAcode.m :Generate C/A code and calculate correlation function
%  
%           Copyright (C) 2019 by Jason DING , All rights reserved.
%  
%    version :$Revision: 1.1 $ $Date: 2019/03/13 $
%    history : 2019/03/13  1.0  new
%              2019/03/17  1.1  Fixed G2 generator error 
% *************************************************************************

% Constants ***************************************************************
CODE_LENGTH   = 1023;           % Number of chips   
NUM           = 500;            % Absolute value of shift number

% Code conversion,{0£¬1}->{1,-1} ******************************************
function CA=Trans(CA,CodeLength)
for i=1:CodeLength
    CA(i)=(CA(i)==0)*(1)+(CA(i)==1)*(-1);
end
end

% Generate two C/A code correlation functions *****************************
function Rkl = Relafunc(Rk,Rl,CodeLength,NUM)
Rkl= zeros(2*NUM+1);
for k = 1:2*NUM+1
    n = k-NUM-1;
        for i = 1:CodeLength
            if i+n>1023
                Rl_n=Rl(i+n-1023);
            elseif i+n<1
                Rl_n=Rl(i+n+1023);
            elseif i+n>=1 && i+n<=1023
                Rl_n=Rl(i+n);
            end
        Rkl(k)=Rkl(k)+Rk(i)*Rl_n;
        end
   
    Rkl(k)=Rkl(k)/CodeLength;
end

end

% Generate C/A code *******************************************************
function C_A = generateC_A(PRN,CodeLength,Delay)
PRN_SELECTION = [2,6;3,7;4,8;5,9;1,9;2,10;1,8;2,9;3,10;2,3;
                 3,4;5,6;6,7;7,8;8,9;9,10;1,4;2,5;3,6;4,7;
                 5,8;6,9;1,3;4,6;5,7;6,8;7,9;8,10;1,6;2,7;
                 3,8;4,9;5,10;];
% Select PRN
S1=PRN_SELECTION(PRN,1);
S2=PRN_SELECTION(PRN,2);
% G1, G2 generator initialization
G1=ones(1,10);
G2=ones(1,10);
C_A=zeros(1,CodeLength);

for i=1:CodeLength+Delay
    NewBit=mod(G1(3)+G1(10),2);
    G_1=G1(10);
    G1=[NewBit G1(1:9)];

    NewBit=mod(G2(10)+G2(9)+G2(8)+G2(6)+G2(3)+G2(2),2); 
    G_2i=mod(G2(S1)+G2(S2),2);
    G2=[NewBit G2(1:9)];
    
    if i>Delay
    C_A(i-Delay)=mod(G_1+G_2i,2);
    end
end
end
