.
.
m=input('Enter number of FFs : ');
while 1
    b=input('Enter sequence [ ]: ');
    [bm,bn]=size(b);
    if bn==m
        break;
    end
    fprintf("worng Sequence, try again !\n");
end
bb=b;
b(m+1)=0;
a=0;
while 1
    b=bb;
    t=input('Enter tapping positions [ ]: ');
    [tm,tn]=size(t);
    zz=t(1);
    for i=1:((2^m)-1)
       b(2:(m+1))=b(1:(m));
       xoro=b(zz+1);
       for k=2:tn
           xoro=xor(xoro,b(t(k)+1));
       end
       b(1)=xoro;
       %disp(b);
       a(i)=b(m+1); 
    end
    if bb(1:m)==b(1:m)
        fprintf("Tapping Positions are correct, Sequence is :");
        disp(a);
        break;
    end
    fprintf("Tapping Positions are worng!\n");    
end
cc=a;
fin_seq=a;
d=input('Enter delay : ');
y=circshift(a,d);
z=xor(y,a);
[zm,zn]=size(z);
ag=0;
disg=0;
n=(2^m)-1;
for i=1:zn
    if z(i)==0
        ag=ag+1;
        cc(i)=1;
    else
        disg=disg+1;
        cc(i)=-1/n;
    end
end
tot=(ag-disg);
if tot==-1 || d==0
    fprintf("Follows Auto-Correlation\n");
    N=2^m-1;
    corre=correlation(fin_seq,N);
      ta=-2*N:1:2*N;
      grid on;
      plot(ta,corre);
      grid on;axis([-2*N-1 2*N+1 -1 1.5]);
      title('autocorrelation of M-sequence : ');
      xlabel('timeperiod');
      ylabel('amplitude');
else
    fprintf("Donot Follow Auto-Correlation\n");
end
