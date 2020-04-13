clc;clear;
M=[20,40,80,160];%x�ķָ�������
N=[10,20,40,80];%y�ķָ�������
K=size(M,2);
x_cell=cell(K,1);%x���������
y_cell=cell(K,1);%y���������
u_cell=cell(K,1);%��ֵ��
u0_cell=cell(K,1);%��ȷ��
epsilon_cell=cell(K,1);%���
%���ͼ
for k=1:K
    [x_cell{k,1},y_cell{k,1},u_cell{k,1}]=fsolve(M(k),N(k));%����ֵ��
    u0_cell{k,1}=fa(x_cell{k,1},y_cell{k,1});%��ȷ��
    epsilon_cell{k,1}=abs(u_cell{k,1}-u0_cell{k,1});%���
    figure(k)
    mesh(x_cell{k,1},y_cell{k,1},epsilon_cell{k,1});%��ͼ
    title(strcat('h1=1/',mat2str(M(k)/2),' h2=1/',mat2str(N(k))));
    xlabel('x');ylabel('y');zlabel('|u(x_{i},y_{j})-u_{ij}|');
end

%��ȷ�����ֵ��Ա�
figure(k+1)
subplot(1,2,1)
mesh(x_cell{2,1},y_cell{2,1},u_cell{2,1});
xlabel('x');ylabel('y');zlabel('u_{ij}');
title('h1=1/20,h2=1/20ʱ����ֵ��');
subplot(1,2,2)
mesh(x_cell{2,1},y_cell{2,1},u0_cell{2,1});
xlabel('x');ylabel('y');zlabel('u(x_{i},y_{j})');
title('��ȷ��');