function x=forback_predictm(y,L,p)
y=y(:);                      % ��yתΪ������
u1=back_predictm(y,L,p);     % ���������������
u2=for_predictm(y,L,p);      % ����ǰ����������
x=[u1; y; u2];               % ��ǰ����Ԥ����y�ϲ���������

