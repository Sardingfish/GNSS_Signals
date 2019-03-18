%产生C/A码并绘制相关系数
%
%mod(a+b,2)代表a和b的模2和
CODE_LENGTH   = 1023;           %码片数   
NUM           = 500;            %移位数绝对值

%2-2(a)--------------------------------------------------------------------
 CA_19_0 = generateC_A(19,CODE_LENGTH,0);
 CA_19_0 = Trans(CA_19_0,CODE_LENGTH);
 R1 = Relafunc(CA_19_0,CA_19_0,CODE_LENGTH,NUM);
 figure(1);
 plot((-NUM:NUM),R1);
 axis([-NUM NUM -0.2 1.05])
 xlabel('移位n');
 ylabel('相关函数');
 title('PRN19自相关函数');
 
%2-2(b)--------------------------------------------------------------------
CA_19_200 = generateC_A(19,CODE_LENGTH,200);
CA_19_200 = Trans(CA_19_200,CODE_LENGTH);
R2 = Relafunc(CA_19_0,CA_19_200,CODE_LENGTH,NUM);
figure(2);
plot((-NUM:NUM),R2);
xlabel('移位n');
ylabel('相关函数');
title('延迟200码片PRN19与PRN19交叉相关函数');
axis([-NUM NUM -0.2 1.05])

%2-2(c)--------------------------------------------------------------------
CA_25_0 = generateC_A(25,CODE_LENGTH,0);
CA_25_0 = Trans(CA_25_0,CODE_LENGTH);
R3 = Relafunc(CA_19_0,CA_25_0,CODE_LENGTH,NUM);
figure(3);
plot((-NUM:NUM),R3);
xlabel('移位n');
ylabel('相关函数');
title('PRN19与PRN25交叉相关函数');
axis([-NUM NUM -0.2 1.05])

%2-2(d)--------------------------------------------------------------------
CA_5_0 = generateC_A(5,CODE_LENGTH,0);
CA_5_0 = Trans(CA_5_0,CODE_LENGTH);
R4 = Relafunc(CA_19_0,CA_5_0,CODE_LENGTH,NUM);
figure(4);
plot((-NUM:NUM),R4);
xlabel('移位n');
ylabel('相关函数');
title('PRN19与PRN5交叉相关函数');
axis([-NUM NUM -0.2 1.05])

%2-2(e)--------------------------------------------------------------------
CA_19_350 = generateC_A(19,CODE_LENGTH,350);
CA_19_350 = Trans(CA_19_350,CODE_LENGTH);
CA_25_905 = generateC_A(25,CODE_LENGTH,905);
CA_25_905 = Trans(CA_25_905,CODE_LENGTH);
CA_5_75 = generateC_A(5,CODE_LENGTH,75);
CA_5_75 = Trans(CA_5_75,CODE_LENGTH);
CA_123=CA_19_350+CA_25_905+CA_5_75;

R5=Relafunc(CA_19_0,CA_123,CODE_LENGTH,NUM);
figure(5);
plot((-NUM:NUM),R5);
xlabel('移位n');
ylabel('相关函数');
title('(x1+x2+x3)与PRN19交叉相关函数');
axis([-NUM NUM -0.2 1.05])

%2-2(f)--------------------------------------------------------------------
figure(6);
noise = 4*randn(1,CODE_LENGTH);
subplot(4,1,1);
plot((1:CODE_LENGTH),CA_19_350);
axis([0 CODE_LENGTH+1 -4.1 4.1])

subplot(4,1,2);
plot((1:CODE_LENGTH),CA_25_905);
axis([0 CODE_LENGTH+1 -4.1 4.1])

subplot(4,1,3);
plot((1:CODE_LENGTH),CA_5_75);
axis([0 CODE_LENGTH+1 -4.1 4.1])

subplot(4,1,4);
plot((1:CODE_LENGTH),noise);
axis([0 CODE_LENGTH+1 -4.1 4.1])

%2-2(g)--------------------------------------------------------------------
CA_123n=CA_123+noise;
R7=Relafunc(CA_19_0,CA_123n,CODE_LENGTH,NUM);
figure(7);
plot((-NUM:NUM),R7);
xlabel('移位n');
ylabel('相关函数');
title('(x1+x2+x3+noise)与PRN19交叉相关函数');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%转换，{0，1}->{1,-1}
function CA=Trans(CA,CodeLength)
for i=1:CodeLength
    if CA(i)==0
        CA(i)=1;
    elseif CA(i)==1
            CA(i)=-1;
    end
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%生成相关系数
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%生成C/A码
function C_A = generateC_A(PRN,CodeLength,Delay)
PRN_SELECTION = [2,6;3,7;4,8;5,9;1,9;2,10;1,8;2,9;3,10;2,3;
                 3,4;5,6;6,7;7,8;8,9;9,10;1,4;2,5;3,6;4,7;
                 5,8;6,9;1,3;4,6;5,7;6,8;7,9;8,10;1,6;2,7;
                 3,8;4,9;5,10;];
% 这里选择PRN
S1=PRN_SELECTION(PRN,1);
S2=PRN_SELECTION(PRN,2);
%G1、G2发生器初始化
G1=ones(1,10);
G2=ones(1,10);
C_A=zeros(1,CodeLength);

for i=1:CodeLength+Delay
    NewBit=mod(G1(3)+G1(10),2);
    G_1=G1(10);
    G1=[NewBit G1(1:9)];

    NewBit=mod(G2(S1)+G2(S2),2); 
    G_2i=G2(10);
    G2=[NewBit G2(1:9)];
    
    if i>Delay
    C_A(i-Delay)=mod(G_1+G_2i,2);
    end
end
end
