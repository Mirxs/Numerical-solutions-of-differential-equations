clc;clear;
tau=[1/10,1/20,1/40,1/80];%ʱ�䲽��
h=[1/10,1/20,1/40,1/80];%�ռ䲽��
K=size(tau,2);
t_cell=cell(K,1);%ʱ������
x_cell=cell(K,1);%�ռ�����
u_cell=cell(K,1);%��ֵ��
ua_cell=cell(K,1);%��ȷ��
epsilon_cell=cell(K,1);%�������
for n=1:K
    [t_cell{n,1},x_cell{n,1},u_cell{n,1}]=fsolve(tau(n),h(n));%����ֵ��
    ua_cell{n,1}=fa(t_cell{n,1},x_cell{n,1});%��ȷ��
    epsilon_cell{n,1}=abs(ua_cell{n,1}-u_cell{n,1});%��������
end
figure(1);
%t=1,tau=1/10,h=1/10ʱ��ֵ��;�ȷ��Ա�
plot(x_cell{1,1},u_cell{1,1}(1/tau(1)+1,:),'b--o'...
    ,x_cell{1,1},ua_cell{1,1}(1/tau(1)+1,:),'r--x')
h=legend('$u_{\tau,h}(x,1)$','u(x,1)');
set(h,'Interpreter','latex') %����legendΪlatex������
title('t=1ʱ��ֵ��;�ȷ��');
xlabel('x');ylabel('u(x,1)');

%����t=1ʱ���������
figure(2)
plot(x_cell{1,1},epsilon_cell{1,1}(1/tau(1)+1,:),'b--o');
hold on;
plot(x_cell{2,1},epsilon_cell{2,1}(1/tau(2)+1,:),'r--x');
hold on;
plot(x_cell{3,1},epsilon_cell{3,1}(1/tau(3)+1,:),'g--s');
hold on;
plot(x_cell{4,1},epsilon_cell{4,1}(1/tau(4)+1,:),'y--x');
hold on;
h=legend('$\tau=1/10,h=1/10$','$\tau=1/20,h=1/20$','$\tau=1/40,h=1/40$','$\tau=1/80,h=1/80$');
set(h,'Interpreter','latex') %����legendΪlatex������
title('t=1ʱ���������');
xlabel('x');ylabel('|u(x_{i},t_{n}-u_{i}^{n})|');