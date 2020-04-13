clc
u1=f3(pi/10);%����Ϊpi/10ʱ����ֵ��
u2=f3(pi/20);%����Ϊpi/20ʱ����ֵ��
u3=f3(pi/40);%����Ϊpi/40ʱ����ֵ��
u4=f3(pi/80);%����Ϊpi/80ʱ����ֵ��
x1=0:pi/10:pi;x2=0:pi/20:pi;x3=0:pi/40:pi;x4=0:pi/80:pi;
%��ȷ��
y1=cos(x1)+sin(x1);y2=cos(x2)+sin(x2);y3=cos(x3)+sin(x3);y4=cos(x4)+sin(x4);
%����Ϊpi/10����ֵ��;�ȷ��

figure(1)
title('��ֵ��;�ȷֵ�Ա�');
plot(x1,u1,'b-d',x1,y1,'ro');
legend('h=pi/10ʱ����ֵ��','��ȷ��')
xlabel('x');ylabel('u(x)')


figure(2)
title('�������')
abs(u1-y1)
plot(x1,abs(u1-y1),'r-o',x2,abs(u2-y2),'g-s',x3,abs(u3-y3),'b-x',x4,abs(u4-y4),'y-x');%�����������ͼ
h=legend('$h=\frac{\pi}{10}$','$h=\frac{\pi}{20}$','$h=\frac{\pi}{40}$','$h=\frac{\pi}{80}$');
set(h,'Interpreter','latex') %����legendΪlatex��������ʾ��ʽ
xlabel('x');ylabel('|u(x)-u_h(x)|');