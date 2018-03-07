function Z=Phase_Gmtda(x,N,L,M,fs,nx1,nx2,wintype)
if M+2*L-N==0, disp('M+2*L-N����Ϊ0,����������'); return; end
x=x(:)';                        % ��תΪ������
arc=pi/180;                     % 1����
u1=x(1:N);                      % ��������
u2=x(L+1:L+M);
if wintype==1                   % ���δ�
    U1=fft(u1);                 % ��1����FFT
    U2=fft(u2);                 % ��2����FFT
elseif wintype==2               % ������
    w1=hann(N,'periodic')';     % ����������,��N
    w2=hann(M,'periodic')';     % ����������,��M
    U1=fft(u1.*w1);             % �˴�������FFT
    U2=fft(u2.*w2);
end
df1=fs/N;                       % ��1���зֱ��� 
df2=fs/M;                       % ��2���зֱ��� 
n11=fix(nx1/df1);               % ��1����U1����Ѱ���� 
n12=round(nx2/df1);
n21=fix(nx1/df2);               % ��2����U2����Ѱ����
n22=round(nx2/df2);

[Umax,index]=max(abs(U1(n11:n12)));  % ��1����Ѱ�����ֵ
k1=n11+index-2;                 % �ɼ���ʵ��Ƶ��:k1*df1
UMAX=Umax;                      % �������ֵ�ķ�ֵ
KMAX=k1;                        % �������ֵ��k1
k2=k1+1;                        % ���ֵƵ�ʵ�������
angle1=atan2(imag(U1(k2)),real(U1(k2)));% ����������Ѱ�����

[Umax,index]=max(abs(U2(n21:n22)));  % ��2����Ѱ�����ֵ
k1=n21+index-2;                 % �ɼ���ʵ��Ƶ��:k1*df2
k2=k1+1;                        % ���ֵƵ�ʵ�������
angle2=atan2(imag(U2(k2)),real(U2(k2)));% ����������Ѱ�����

dangle=angle1-angle2;           % ������λ��
delta=dangle-pi*(k1-KMAX*M/N)+2*pi*KMAX*L/N;  % ��ʽ(6-4-30)����delta
del=mod(delta,2*pi);            % ��delta����2*pi��Χ��
del=del-(del>pi)*2*pi+(del<-pi)*2*pi; % ��del����-pi~pi��Χ��
dk1=-del*N/pi/(N-M-2*L);        % ��ʽ(6-4-31)����di
dk=dk1+(dk1<-0.5)-(dk1>0.5);    % ��di����-0.5~0.5��Χ��

Z(2)=(KMAX-dk)*fs/N;            % ��ʽ(6-4-32)����Ƶ��
Z(3)=angle1+dk*pi;              % ��ʽ(6-4-33)�����ʼ���
if wintype==1                   % ��ʽ(6-4-35)������δ��ķ�ֵ
    Z(1)=2*UMAX/sinc(dk)/N;
elseif wintype==2               % ��ʽ(6-4-36)���㺣�����ķ�ֵ
    Z(1)=4*UMAX*(1-dk*dk)/sinc(dk)/N;
end


