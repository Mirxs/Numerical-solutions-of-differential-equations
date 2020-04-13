clc;clear;
M=[20,40,80,160];%x�ķָ�������
N=[10,20,40,80];%y�ķָ�������
K=size(M,2);
x_cell=cell(K,1);%x���������
y_cell=cell(K,1);%y���������
u_cell=cell(K,1);%��ֵ��
u0_cell=cell(K,1);%��ȷ��
epsilon_cell=cell(K,1);%���
max_epsilon=ones(K,1);%������
rate=ones(K-1,1);%����

for k=1:K
    [x_cell{k,1},y_cell{k,1},u_cell{k,1}]=fsolve(M(k),N(k));%����ֵ��
    u0_cell{k,1}=fa(x_cell{k,1},y_cell{k,1});%��ȷ��
    epsilon_cell{k,1}=u_cell{k,1}-u0_cell{k,1};%���
    max_epsilon(k,1)=max(epsilon_cell{k,1}(:));%������
end

%������
for k=1:K-1
    rate(k,1)=log2(max_epsilon(k)/max_epsilon(k+1));
end

%ȡx=0.4��0.8��1.2��1.6��y=0.5ʱ����ֵ��;�ȷ��
x=[0.4,0.8,1.2,1.6];y=0.5;
u2=ones(4,4);%��ֵ��
for k=1:K
    u2(k,:)=u_cell{k,1}(M(k)/5+1:M(k)/5:4*M(k)/5+1,N(k)/2+1);%���ض������ֵ��
end

u0_1=fa(x,y);%�ض���ľ�ȷ��



