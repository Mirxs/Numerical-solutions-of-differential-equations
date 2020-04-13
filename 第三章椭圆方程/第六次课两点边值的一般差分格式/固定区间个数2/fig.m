clc;clear;
%����N=64ʱ��ֱ�Ӳ���²���ϵ��Ϊ0.95��1��1.05ʱ����ֵ��;�ȷ��
N=64;
k=[0.95,1,1.05];%����ϵ��
x_cell=cell(3,1);u_cell=cell(3,1);u0_cell=cell(3,1);
for n=1:3
    [h,x]=fh(64,k(n));
    u=fsolve(x,h);%ֱ�Ӳ�ֵ���ֵ��
    u_cell{n,1}=u;x_cell{n,1}=x;
    u0=exp(x).*cos(x);%��ȷ��
    u0_cell{n,1}=u0;
    figure(n);
    plot(x,u,'b--o',x,u0,'r--x')
    title(strcat('k=',mat2str(k(n))));
    legend('��ֵ��','��ȷ��');
    xlabel('x');ylabel('u');
end

figure(4);
%N=64ʱ����ͬ����ϵ������ֵ������
plot(x_cell{1,1},abs(u0_cell{1,1}-u_cell{1,1}),'b--o');
hold on;
plot(x_cell{2,1},abs(u0_cell{2,1}-u_cell{2,1}),'r--o');
hold on;
plot(x_cell{3,1},abs(u0_cell{3,1}-u_cell{3,1}),'g--o');
hold on;
legend('k=0.95','k=1','k=1.05');
xlabel('x');ylabel('���');