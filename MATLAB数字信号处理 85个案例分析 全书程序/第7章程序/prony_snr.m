function snr=prony_snr(x,y)
N=length(x);                 % x�ĳ���
s1=0; s2=0;                  % ��ʼ��

for k=1 : N
    s1=s1+(x(k)-y(k))^2;     % ����ʽ(7-4-15)�ķ�ĸ
    s2=s2+x(k)^2;            % ����ʽ(7-4-15)�ķ���
end

snr=10*log10(s2/s1);         % ����ʽ(7-4-15)



