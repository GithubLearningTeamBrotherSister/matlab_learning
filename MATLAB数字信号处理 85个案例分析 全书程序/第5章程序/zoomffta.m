function [xz,fz]=zoomffta(x,fs,N,fe,D,a)
M=round(4*D/a);                   % �˲��������
k=1:M;                          
w=0.5+0.5*cos(pi*k/M);            % Hanning��(�봰)

% ��ȡ�����ͨ�˲������½磻
fl=max(fe-fs/(4*D),-fs/2);
fh=min(fe+fs/(4*D),fs/2);

% ��ȡ��չ��ͨ�˲������½磻
hfl=fl-(fh-fl)*a/2;
hfh=fh+(fh-fl)*a/2;

%������չ��ͨ�˲�����
wl=2*pi*hfl/fs;                   % hfl��hfh��һ����Ƶ��
wh=2*pi*hfh/fs;
hr(1)=(wh-wl)/pi;                 % ��ʽ(5-2-18a)���㸴������ͨ�˲���ʵ��
hr(2:M+1)=(sin(wh*k)-sin(wl*k))./(pi*k).*w;
hi(1)=0;                          % ��ʽ(5-2-18a)���㸴������ͨ�˲����鲿
hi(2:M+1)=(cos(wl*k)-cos(wh*k))./(pi*k).*w;

%�ز������˲�
for k=1:N
    kk=(k-1)*D+M; 
    xrz(k)=x(kk+1)*hr(1)+sum(hr(2:M+1).*(x(kk+2:kk+M+1)+x(kk:-1:kk-M+1)));
    xiz(k)=x(kk+1)*hi(1)+sum(hi(2:M+1).*(-x(kk+2:kk+M+1)+x(kk:-1:kk-M+1)));
end

%��Ƶ����fl�Ƶ�0Ƶ
yf=D*fl/fs;                       % ��Ƶ��
xz=(xrz+1j*xiz).*exp(-1j*2*pi*(0:N-1)*yf); % ��Ƶ

xz=fft(xz);                      % FFT
xz=xz(1:N/2)/N;                  % ȡϸ��������
fz=(0:N/2-1)*fs/N/D+fl;          % ����ϸ���׶�Ӧ��Ƶ��
