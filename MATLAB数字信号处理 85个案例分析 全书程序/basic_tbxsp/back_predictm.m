function y=back_predictm(x,M,p)
x=x(:);                 % ��xתΪ������
ar1=arburg(x,p);        % �����Իع����ar
yy=zeros(M,1);          % ��ʼ��
yy=[yy; x(1:p)];        % ׼������Ԥ�������
for l=1 : M             % ����Ԥ���M����
    for k=1 : p         % ��ʽ(4-6-27)�ۼ�
        yy(M+1-l)=yy(M+1-l)-yy(M+1-l+k)*ar1(k+1);
    end
    yy(M+1-l)=real(yy(M+1-l));
end
y=yy(1:M);              % �ú���Ԥ�������

