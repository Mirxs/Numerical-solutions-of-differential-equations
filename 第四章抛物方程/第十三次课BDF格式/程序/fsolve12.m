function [t,x,u] = fsolve12(tau,h)
%   ��Crank-Nicolson��ʽ������ֵ��
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
    a1=ones(M-2,1)*(-r/2);%�¶Խ���
    b1=ones(M-1,1)*(1+r);%���ӽ���
    c1=ones(M-2,1)*(-r/2);%�϶Խ���
    A1=diag(b1,0)+diag(a1,-1)+diag(c1,1);%ϵ������
    
    a2=-a1;
    b2=ones(M-1,1)*(1-r);
    c2=-c1;
    A2=diag(b2,0)+diag(a2,-1)+diag(c2,1);%ϵ������
    for k=2:N+1
        %�Ҷ���
        f=A2*u(k-1,2:M)';
        f(1)=f(1)+r/2*(u(k,1)+u(k-1,1));
        f(M-1)=f(M-1)+r/2*(u(k,M+1)+u(k-1,M+1));
        u(k,2:M)=(A1\f)';%��k-1�����k���ֵ
    end
end

