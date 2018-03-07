function Z=FFT_apFFTcorrm(y,N,fs,NX1,NX2)
y=y(:)';                       % ��y��Ϊһ������
win=hanning(N)';               % ������
y1 = y(N:2*N-1);               % ��1������ȡֵ
win2 = win/sum(win);           % ��һ��
y11= y1.*win2;                 % �˺�����
y11_fft = fft(y11,N);          % FFT
a1 = abs(y11_fft);             % ��ʽ(6-5-11a)���ֵ
p1 = mod(phase(y11_fft),2*pi); % ��ʽ(6-5-11b)����λ��

y2 = y(1:2*N-1);               % ��2������ȡֵ
winn =  conv(win,win);         % ���������
win2 = winn/sum(winn);         % ��һ��
y22= y2.*win2;                 % �˺��������
y222=y22(N:end)+[0 y22(1:N-1)];% ���ɳ�N��apFFT������������
y2_fft = fft(y222,N);          % FFT
a2 = abs(y2_fft);              % ��ʽ(6-5-12a)���ֵ
p2=mod( phase(y2_fft),2*pi);   % ��ʽ(6-5-12b)����λ��

dp=p1-p2;                      % �����λ��
dp=dp-(dp>pi)*2*pi+(dp<-pi)*2*pi; % ��del����-pi~pi��Χ��
ee=(dp)/pi/(1-1/N);            % ��ʽ(6-5-14)����Ƶ��У����
aa=(a1.^2)./a2*2;              % ��ʽ(6-5-15)�����źŷ�ֵ

df=fs/N;                       % Ƶ�ʷֱ���
mx1=fix(NX1/df)+1;             % ��Ѱ�Ҽ���ֵ���������� 
mx2=fix(NX2/df)+1;
[Amax,floc]=max(a2(mx1:mx2));  % Ѱ�Ҽ���ֵ
floc=floc+mx1-1;               % ����ֵ������
fcor=(floc-1)*df;              % ����ֵ����Ӧ��Ƶ��
Z(2)=fcor+ee(floc)*df;         % ����Ƶ��
Z(3)=p2(floc);                 % �����ʼ���
Z(1)=aa(floc);                 % �����ֵ

