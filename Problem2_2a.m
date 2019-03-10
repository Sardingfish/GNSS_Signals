%mod(a+b,2)代表a和b的模2和
CODE_LENGTH   = 1023;                          %码片数
NUM           = 50;                            %移位数绝对值
PRN_SELECTION = [2,6;3,7;4,8;5,9;1,9;          %卫星对应的S1、S2
                 2,10;1,8;2,9;3,10;2,3;
                 3,4;5,6;6,7;7,8;8,9;
                 9,10;1,4;2,5;3,6];
            
%G1、G2发生器初始化
G1=ones(1,10);
G2=ones(1,10);
CA=zeros(1,CODE_LENGTH);

% 这里选择PRN1,2and6
S1=PRN_SELECTION(19,1);
S2=PRN_SELECTION(19,2);

for i=1:CODE_LENGTH
    NewBit=mod(G1(3)+G1(10),2);
    G_1=G1(10);
    G1=[NewBit G1(1:9)];

    NewBit=mod(G2(S1)+G2(S2),2); 
    G_2i=G2(10);
    G2=[NewBit G2(1:9)];
    
    CA(i)=mod(G_1+G_2i,2);
end

%转换，{0，1}->{1,-1}
for i=1:CODE_LENGTH
    if CA(i)==0
        CA(i)=1;
    elseif CA(i)==1
            CA(i)=-1;
    end
end


R = zeros(2*NUM+1);
for k = 1:2*NUM+1
    n = k-NUM-1;
    if n>=0
            for i = 1:(1023-n)
            R(k)=R(k)+CA(i)*CA(i+n);
            end
    elseif n<0
            for i = -(n-1):1023
            R(k)=R(k)+CA(i)*CA(i+n);
            end
    end
    R(n+NUM+1)=R(n+NUM+1)/(1023-abs(n));
end

xx=(-NUM:NUM);
plot(xx,R);

