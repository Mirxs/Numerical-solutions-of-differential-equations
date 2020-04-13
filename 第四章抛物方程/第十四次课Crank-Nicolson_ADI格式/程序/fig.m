clc;clear;
tau=[1/10,1/20,1/40,1/80];%ʱ�䲽��
h=[1/10,1/20,1/40,1/80];%�ռ䲽��
K=size(tau,2);
t_cell=cell(K,1);%ʱ������
x_cell=cell(K,1);%�ռ�����x
y_cell=cell(K,1);%�ռ�����y
u_cell=cell(K,1);%��ֵ��
ua_cell=cell(K,1);%��ȷ��
epsilon_cell=cell(K,1);%�������
for n=1:K
    [t_cell{n,1},x_cell{n,1},y_cell{n,1},u_cell{n,1}]=fsolve(tau(n),h(n));%����ֵ��
    ua_cell{n,1}=fa(t_cell{n,1},x_cell{n,1},y_cell{n,1});%��ȷ��
    epsilon_cell{n,1}=abs(ua_cell{n,1}-u_cell{n,1});%��������
end
figure(1);
%t=1,tau=1/10,h=1/10ʱ��ֵ��;�ȷ��Ա�
figure(1);
subplot(1,2,1);
x=reshape(x_cell{1,1}(1/tau(1)+1,:,:),[11,11]);
y=reshape(y_cell{1,1}(1/tau(1)+1,:,:),[11,11]);
z=reshape(u_cell{1,1}(1/tau(1)+1,:,:),[11,11]);
mesh(x,y,z);
title('��ֵ��');xlabel('x');ylabel('y');zlabel('u(x,y,1)');
subplot(1,2,2)
ua=reshape(ua_cell{1,1}(1/tau(1)+1,:,:),[11,11]);
mesh(x,y,ua);
title('��ȷ��');xlabel('x');ylabel('y');zlabel('u(x,y,1)');


%t=1ʱ���������

for k=1:K
    figure(k+1)
    x=reshape(x_cell{k,1}(1/tau(k)+1,:,:),[1/h(k)+1,1/h(k)+1]);
    y=reshape(y_cell{k,1}(1/tau(k)+1,:,:),[1/h(k)+1,1/h(k)+1]);
    e=reshape(epsilon_cell{k,1}(1/tau(k)+1,:,:),[1/h(k)+1,1/h(k)+1]);
    mesh(x,y,e);
    title(strcat('\tau=1/',mat2str(1/tau(k)),' h=1/',mat2str(1/h(k))));
    xlabel('x');ylabel('y');zlabel('���');
end