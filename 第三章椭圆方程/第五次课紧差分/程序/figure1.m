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

figure(1);%��ȷ�����ֵ��Ա�ͼ
plot(x{1,1},u1{1,1},'b--o',x{1,1},cos(x{1,1})+sin(x{1,1}),'r-x');
legend('h=pi/10ʱ����ֵ��','��ȷ��');xlabel('x');ylabel('u(x)');title('����ָ�ʽ����ֵ��;�ȷ��Ա�');
figure(2);%�������ͼ
plot(x{1,1},epsilon{1,1},'b--o',x{2,1},epsilon{2,1},'r--s',x{3,1},...
    epsilon{3,1},'g--o',x{4,1},epsilon{4,1},'y--x');
legend('h=pi/10','h=pi/20','h=pi/40','h=pi/80');xlabel('x');ylabel('u_h(x)-u_0(x)');
title('����ָ�ʽ���������');