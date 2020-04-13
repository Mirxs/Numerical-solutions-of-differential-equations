function [t,x,y,u] = fsolve(tau,h)
%   �����Euler ADI��ʽ������ֵ��
%   @t ʱ������
%   @x �ռ�����x
%   @x �ռ�����y
%   @tau ʱ�䲽��
%   @h �ռ䲽��
%   @u ��ֵ��
    N=1/tau;%t���ָ��������
    M=1/h;%x���ָ��������
    t=0:tau:1;
    x=0:h:1;
    y=0:h:1;
    u=zeros(N+1,M+1,M+1);
    
    [t,x,y]=meshgrid(t,x,y);
    %ת�ã�ʹ֮���� N+1 * M+1 * M+1
    t=permute(t,[2,1,3]);
    x=permute(x,[2,1,3]);
    y=permute(y,[2,1,3]);
    
    u(1,:,:)=exp((x(1,:,:)+y(1,:,:))/2);%��ֵ
    %��ֵ
    u(:,1,:)=exp((1/2)*y(:,1,:)-t(:,1,:));%u(0,y,t)=e^(y/2-t)
    u(:,M+1,:)=exp((1/2)*(1+y(:,M+1,:))-t(:,M+1,:));%u(1,y,t)=e^((1+y)/2-t)
    u(:,:,1)=exp((1/2)*x(:,:,1)-t(:,:,1));%u(x,0,t)=e^(x/2-t)
    u(:,:,M+1)=exp((1/2)*(1+x(:,:,M+1))-t(:,:,M+1));%u(x,1,t)=e^((1+x)/2-t)

    r=tau/h^2;%����ϵ��
    a=ones(M-2,1)*(-r);%�¶Խ���
    b=ones(M-1,1)*(1+2*r);%���ӽ���
    c=ones(M-2,1)*(-r);%�϶Խ���
    A=diag(b,0)+diag(a,-1)+diag(c,1);%ϵ������
    
    uc=u;%�м��u
    for k=2:N+1
        %��y����������ɵ�k-1�����м��
        for j=2:M
            %���ײ���
            uc(k,1,j)=-r*u(k,1,j-1)+(1+2*r)*u(k,1,j)-r*u(k,1,j+1);
            uc(k,M+1,j)=-r*u(k,M+1,j-1)+(1+2*r)*u(k,M+1,j)-r*u(k,M+1,j+1);
            F=u(k-1,2:M,j)+tau*fr(t(k,2:M,j),x(k,2:M,j),y(k,2:M,j));
            F=F';
            F(1)=F(1)+r*uc(k,1,j);
            F(M-1)=F(M-1)+r*uc(k,M+1,j);
            uc(k,2:M,j)=A\F;
        end
        
        %��x������������м�����k��
        for i=2:M
            F1=uc(k,i,2:M);
            F1=reshape(F1,[M-1,1]);
            F1(1)=F1(1)+r*u(k,i,1);
            F1(M-1)=F1(M-1)+r*u(k,i,M+1);
            u(k,i,2:M)=A\F1;
        end
    end
end

