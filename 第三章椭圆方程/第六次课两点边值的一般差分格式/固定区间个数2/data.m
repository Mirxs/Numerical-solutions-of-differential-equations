clc;clear;
k=[0.95,1,1.05];%����ϵ��
N=[8,16,32,64,128];%�������
epsilon=zeros(3,5);%������
rate=zeros(3,4);%����

for n=1:3
    for m=1:5
        [h,x]=fh(N(m),k(n));%����N��k�õ�x��h
        u=fsolve(x,h);%����x��h���
        u0=exp(x).*cos(x);%��ȷ��
        epsilon(n,m)=max(abs(u-u0));%������
    end
    for m=1:4
        rate(n,m)=log2(epsilon(n,m)/epsilon(n,m+1));
    end
end