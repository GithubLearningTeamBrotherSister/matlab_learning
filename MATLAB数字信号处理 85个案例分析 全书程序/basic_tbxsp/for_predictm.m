function y=for_predictm(x,N,p)
x=x(:);                 % ��xתΪ������
M=length(x);            % x����
L=M-p;                  % ����ǰ��Ԥ��λ��
ar=arburg(x,p);         % �����Իع����ar
xx=x(L+1:L+p);          % ׼��ǰ��Ԥ�������
for i=1:N               % ��ǰԤ���N����
    xx(p+i)=0;          % ��ʼ��
    for k=1:p           % ��ʽ(4-6-3)�ۼ�
        xx(p+i)=xx(p+i)-xx(p+i-k)*ar(k+1);
    end
end
y=xx(p+1:p+N);          % ��ǰ��Ԥ�������


