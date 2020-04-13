clc;clear;
x=cell(5,1);%�ڵ�
u1=cell(5,1);%����ָ�ʽ����ֵ��
u2=cell(5,1);%���Ĳ�ָ�ʽ����ֵ��
epsilon=cell(5,1);%����ָ�ʽ����ֵ��;�ȷ������
h=[pi/10,pi/20,pi/40,pi/80,pi/160];%����
n=1;
for h_item=h
    x1=linspace(0,pi,pi/h_item+1);%���ݲ������ֵĽڵ�
    x{n,1}=x1;
    u=f4(h_item);u1{n,1}=u;%����ָ�ʽ
    u=f3(h_item);u2{n,1}=u;%���Ĳ�ָ�ʽ
    n=n+1;
end
for n=1:5
    epsilon{n,1}=abs(u1{n,1}-(cos(x{n,1})+sin(x{n,1})));
end


%��ͬ������pi/5,2pi/5,3pi/5,4pi/5����ֵ��;�ȷ��
x0=[pi/5,2*pi/5,3*pi/5,4*pi/5];
%��ȷ��
u0=cos(x0)+sin(x0);
%����ָ�ʽ
e1=zeros(5,4);
for n=1:5
    e1(n,:)=u1{n,1}(pi/5/h(n)+1:pi/5/h(n):4*pi/5/h(n)+1);
end
%���Ĳ�ָ�ʽ
e2=zeros(5,4);
for n=1:5
    e2(n,:)=u2{n,1}(pi/5/h(n)+1:pi/5/h(n):4*pi/5/h(n)+1);
end


%��ָ�ʽ��ȡ��ͬ����ʱ��ֵ���������
%����ָ�ʽ
E1=ones(5,1);
for n=1:5
    E1(n,:)=max(epsilon{n,1});
end
%��һ������������/ǰһ������������
rate1=ones(1,4);
for n=1:4
    rate1(n)=E1(n)/E1(n+1);
end
%���Ĳ�ָ�ʽ
E2=ones(5,1);
for n=1:5
    epsilon=abs(u2{n,1}-(cos(x{n,1})+sin(x{n,1})));
    E2(n,:)=max(epsilon);
end
%ǰһ������������/��һ������������
rate2=ones(1,4);
for n=1:4
    rate2(n)=E2(n)/E2(n+1);
end