clc;clear;
tau=[1/10,1/20,1/40,1/80];%ʱ�䲽��
h=[1/10,1/20,1/40,1/80];%�ռ䲽��
K=size(tau,2);
t_cell=cell(K,1);%ʱ������
x_cell=cell(K,1);%�ռ�����
u_cell=cell(K,1);%��ֵ��
ua_cell=cell(K,1);%��ȷ��
epsilon_cell=cell(K,1);%�������
max_epsilon=ones(K,1);
rate=ones(3,1);%����
for n=1:K
    [t_cell{n,1},x_cell{n,1},u_cell{n,1}]=fsolve(tau(n),h(n));%����ֵ��
    ua_cell{n,1}=fa(t_cell{n,1},x_cell{n,1});%��ȷ��
    epsilon_cell{n,1}=abs(ua_cell{n,1}-u_cell{n,1});%��������
    max_epsilon(n,1)=max(epsilon_cell{n,1}(:));%��������
end

%E(t,h)/E(2t,2h)
for n=1:K-1
    rate(n,1)=max_epsilon(n,1)/max_epsilon(n+1,1);
end

%��x=0.5ʱ��ȡt=0.1,0.2,...1ʱ�����ı仯(tau=1/10,h=1/10);
u_1=zeros(10,1);%�ض�����ֵ��
ua_1=zeros(10,1);%�ض��㾫ȷ��
[t,x,u]=fsolve(tau(1),h(1));
ua=fa(t,x);
u_1=u(2:1:11,1/h(1)/2+1);
ua_1=ua(2:1:11,1/h(1)/2+1);
epsion_1=abs(u_1-ua_1);%���