function Z=apFFTcorrm(s,N,L,fs,NX1,NX2)
if length(s)<2*N+L-1, disp('����̫����,���ݱ��볤2N+L-1!!');  return; end
s=s(:)';                       % ��s��Ϊһ������
df=fs/N;                       % Ƶ�ʷֱ���
win=hanning(N)';               % ������1
win1=hann(N)';                 % ������2
win2=conv(win,win1);           % ���������
win2=win2/sum(win2);           % ��һ��
s1=s(1:2*N-1);                 % ��1������ȡֵ
y1=s1.*win2;                   % �˺��������
y1a=y1(N:end)+[0 y1(1:N-1)];   % ���ɳ�N��apFFT������������
Y1=fft(y1a,N);                 % FFT
a1=abs(Y1);                    % ��ʽ(6-5-16a)���ֵ
p1=mod(phase(Y1),2*pi);        % ��ʽ(6-5-16b)����λ��

s2=s(1+L:2*N+L-1);             % ��2������ȡֵ
y2=s2.*win2;                   % �˺��������
y2a=y2(N:end)+[0 y2(1:N-1)];   % ���ɳ�N��apFFT������������
Y2=fft(y2a,N);                 % FFT
a2=abs(Y2);                    % ��ʽ(6-5-17a)���ֵ
p2=mod(phase(Y2),2*pi);        % ��ʽ(6-5-17b)����λ��

mx1=fix(NX1/df)+1;             % ��Ѱ�Ҽ���ֵ����������
mx2=fix(NX2/df)+1;
[fm,fl]=max(a1(mx1:mx2));      % Ѱ�Ҽ���ֵ
fl=fl+mx1-1;                   % ����ֵ������
rr=fl-1;                       % ����Ƶ�ʼ���
dp=p1(fl)-p2(fl);              % ��ʽ(6-5-20)������λ��
dp=mod(dp,2*pi);               % ����λ������2*pi����
dp=dp-(dp>pi)*2*pi+(dp<-pi)*2*pi; % ��del����-pi~pi��Χ��
dk1=dp*N/L/2/pi;               % ��ʽ(6-5-22)����dk
dk1=mod(dk1,1);
dk=dk1+(dk1<-0.5)-(dk1>0.5);   % ��di����-0.5~0.5��Χ��
Z(2)=(rr-dk)*df;               % ��ʽ(6-5-23)����Ƶ��
Z(3)=p1(fl);                   % ��ʽ(6-5-18)�����ʼ��λ��
Wk=(1-dk*dk)/sinc(dk);         % ��������ֵ
Z(1)=2*abs((Wk^2)*a2(fl));     % ��ʽ(6-5-24)�����ֵ



