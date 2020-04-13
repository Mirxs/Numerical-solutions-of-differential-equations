function [h,x] = fh(N,k)
%   ���ع̶��������ΪN�Ͳ���ϵ��kʱ�Ĳ���h��ȡֵ�ڵ�x
%   @N �������
%   @k ����ϵ�� h(i)=k*h(i-1)
%   @h N��Ӧ�Ĳ���
%   @h0 ��ʼ����
    %����ʼ����
    if k==1
        h0=1/N;
    else
        %��h0+h0*k+h0*k^2+h0*k^3...+h0*k^(N-1)==1
        h0=(1-k)/(1-power(k,N));
    end
    %����h��x
    h(1)=h0;
    x=[0,h0];
    for n=2:N
        h(n)=k*h(n-1);
        x(n+1)=x(n)+h(n);
    end
end

