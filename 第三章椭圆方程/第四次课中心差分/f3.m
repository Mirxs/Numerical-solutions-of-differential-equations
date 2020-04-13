function u = f3(h)
%f3 ��׷�Ϸ���ⷽ�̵���Բ���̵���ֵ��
%   @u ��ֵ��
%   @h ����
    N=pi/h-1;%N���ڵ�
    x=h:h:pi-h;%�ڵ�
    d=ones(1,N);%�Ҷ���
    for i=1:N
        d(i)=(x(i)+1)*(sin(x(i))+cos(x(i)));
    end
    d(1)=d(1)+1/h^2;
    d(N)=d(N)-1/h^2;
    a=ones(1,N)*(-1/h^2);%ϵ��������¶Խ���
    b=2/h^2+x;%ϵ����������Խ���
    c=ones(1,N-1)*(-1/h^2);%ϵ��������϶Խ���
    %׷
    %����beta
    beta(1)=c(1)/b(1);
    for i=2:N-1
        beta(i)=c(i)/(b(i)-a(i)*beta(i-1));
    end
    %��Ly=d
    y(1)=d(1)/b(1);
    for i=2:N
        y(i)=(d(i)-a(i)*y(i-1))/(b(i)-a(i)*beta(i-1));
    end
    
    %�ϣ���u:
    u=ones(1,N);
    u(N)=y(N);
    for i=N-1:-1:1
        u(i)=y(i)-beta(i)*u(i+1);
    end
    
    u=[1,u,-1];%�����ֵ
end

