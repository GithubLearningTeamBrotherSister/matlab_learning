function Z=phase1_afterexzfft(xx,fi,Nw,Lw,fs1,nx1,nx2)
if nargin<7,  disp('�����������7��,�벹�����'); return; end

xx=xx(:).';                  % ��xת��Ϊ������
ddf=fs1/Nw;                  % �����Ƶ�ʷֱ���
u1=xx(1:Nw);                 % ��������
u2=xx(Lw+1:Lw+Nw);
w=hanning(Nw);               % ����������

U1=fft(u1.*w');              % ���ݳ˴�������FFT
U1=fftshift(U1);             % Ƶ����������
U2=fft(u2.*w');              % ���ݳ˴�������FFT
U2=fftshift(U2);             % Ƶ����������
if nx1-fi<=0, nx1=fi; end
n1=floor((nx1-fi)/ddf)+1;
n2=floor((nx2-fi)/ddf)+1;

[Umax,index]=max(abs(U1(n1:n2)));  % ��1����Ѱ�����ֵ
k1=n1+index-2;               % �ɼ���ʵ��Ƶ��:k1*df1
UMAX=Umax;                   % �������ֵ�ķ�ֵ
KMAX=k1;                     % ����k1
k2=k1+1;
angle1=atan2(imag(U1(k2)),real(U1(k2)));% ����������Ѱ�����

[Umax,index]=max(abs(U2(n1:n2)));  % ��2����Ѱ�����ֵ
k1=n1+index-2;               % �ɼ���ʵ��Ƶ��:k1*df2
k2=k1+1;                     % ���ֵƵ�ʵ�������
angle2=atan2(imag(U2(k2)),real(U2(k2)));% ����������Ѱ�����

dangle=angle2-angle1;        % ������λ��
delta=2*pi*KMAX*Lw/Nw-dangle;  % ��ʽ(6-4-17)����delta
del=mod(delta,2*pi);         % ��delta����2*pi��Χ��
del=del-(del>pi)*2*pi+(del<-pi)*2*pi; % ��del����-pi~pi��Χ��
dk1=del/2/pi/(Lw/Nw);        % ��ʽ(6-4-17)����di
dk=dk1+(dk1<-0.5)-(dk1>0.5); % ��di����-0.5~0.5��Χ��

Z(2)=(KMAX-dk)*ddf+fi;       % ��ʽ(6-4-32)����Ƶ�ʲ����ϳ�ʼֵ
Z(3)=angle1+dk*pi;           % ��ʽ(6-4-33)�����ʼ���
Z(1)=4*UMAX*(1-dk*dk)/sinc(dk)/Nw;  % ��ʽ(6-2-21)��������������µķ�ֵ

