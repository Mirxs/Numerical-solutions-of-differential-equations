function r =fa(t,x)
%  ��ȷ��
%  @t ʱ������
%  @x �ռ�����
   [t,x]=meshgrid(t,x);
   t=t';
   x=x';
   r=exp(x+t);
end