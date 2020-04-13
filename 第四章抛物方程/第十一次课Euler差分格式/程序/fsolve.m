function [t,x,u] = fsolve(tau,h)
%   �����Euler�������﷽��
%   @t ʱ������
%   @x �ռ�����
%   @tau ʱ�䲽��
%   @h �ռ䲽��
%   @u ��ֵ��
    N=1/tau;%t���ָ��������
    M=1/h;%x���ָ��������
    t=0:tau:1;
    x=0:h:1;
    u=ones(N+1,M+1);
    u(1,:)=exp(x);%��ֵ
    %��ֵ
    u(:,1)=exp(t);
    u(:,M+1)=exp(1+t);

    r=tau/h^2;%����ϵ��
    a=ones(M-2,1)*(-r);%�¶Խ���
    c=ones(M-2,1)*(-r);%�϶Խ���
    b=ones(M-1,1)*(1+2*r);%���ӽ���
    A=diag(b,0)+diag(a,-1)+diag(c,1);%ϵ������
    for k=2:N+1
        %�Ҷ���
        f=u(k-1,2:M);
        f(1)=f(1)+r*u(k,1);
        f(M-1)=f(M-1)+r*u(k,M+1);
        u(k,2:M)=(A\f')';%��k-1�����k���ֵ
    end
end

