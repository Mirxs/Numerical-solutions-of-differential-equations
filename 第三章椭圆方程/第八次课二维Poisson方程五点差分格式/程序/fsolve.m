function [x,y,u] = fsolve(M,N)
%   �ø�˹-���¶������ⷽ��
%   @M x�ָ��������
%   @N y�ָ��������
%   @u ��ֵ��
%   @x,y �������
    K=100000;%��������
    h1=2/M;h2=1/N;%����
    x=0:h1:2;y=0:h2:1;%ȡֵ�ڵ��x��yֵ
    u0=zeros(M+1,N+1);
    u=ones(M+1,N+1);
    %��ֵ����
    u0(1,:)=sin(pi*y);
    u0(M+1,:)=exp(2)*sin(pi*y);
    
    u1=u0;
    for k=1:K
        for m=2:M
            for n=2:N
                u1(m,n)=(f(x(m),y(n))+u1(m,n-1)/(h2*h2)+u1(m-1,n)/(h1*h1)+...
                    u0(m+1,n)/(h1*h1)+u0(m,n+1)/(h2*h2))/(2*(1/(h1*h1)+1/(h2*h2)));
            end
        end
        if norm(u1-u0,'fro')<1e-6 %F����С������ޣ��õ���
            u=u1;break;
        else
            u0=u1;%��������
        end
    end
    %�����������
    [x,y]=meshgrid(x,y);
    x=x';y=y';
end
