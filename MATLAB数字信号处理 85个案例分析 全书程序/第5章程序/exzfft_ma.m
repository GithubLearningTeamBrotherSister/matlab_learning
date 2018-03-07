function [y,freq,c]=exzfft_ma(x,fe,fs,nfft,D)
nt=length(x);           % ����������ݳ���
fi=fe-fs/D/2;           % ����ϸ����ֹƵ������
fa=fi+fs/D;             % ����ϸ����ֹƵ������
na=round(0.5 * nt/D+1); % ȷ����ͨ�˲�����ֹƵ�ʶ�Ӧ����������
% Ƶ��
n=0: nt-1;              % ����������
b=n*pi* (fi+fa)/fs;     % ���õ�λ��ת����
y=x.*exp(-1i*b);        % ����Ƶ�� 
b= fft(y, nt);          % FFT
% ��ͨ�˲����²���
a(1: na) =b(1: na);     % ȡ��Ƶ�ʲ��ֵĵ�Ƶ�ɷ�
a(nt-na+2 : nt) =b(nt-na+2 : nt); % ȡ��Ƶ�ʲ��ֵĵ�Ƶ�ɷ�
b=ifft(a, nt);          % IFFT 
c=b(1 : D: nt);         % �²���
% ��ϸ��Ƶ��
y=fft(c, nfft) * 2/nfft;% ��һ��FFT
y=fftshift(y);          % ��������
freq=fi+(0:nfft-1)*fs/D/nfft; % Ƶ������

