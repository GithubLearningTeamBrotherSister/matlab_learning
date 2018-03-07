%
% pr5_3_2 
clear all; clc; close all;

fs=2048;                     % ����Ƶ��
N=1024;                      % �źų���
df1=fs/N;                    % �ֱ���
n=1:N;                       % ��������
t=(n-1)/fs;                  % ʱ������
f1=431.1; f2=432.2; f3=433.3; % �ź�Ƶ��
% �����ź�����
s=3*cos(2*pi*f1*t)+4*cos(2*pi*f2*t+0.2)+5*cos(2*pi*f3*t+0.4);
wind=hanning(N)';            % ������
S=abs(fft(s.*wind))*4/N;     % FFT�����ֵ
n1=1:N/2;                    % ��Ƶ�ʲ���
% CZT
f0=428; DELf=0.01; M=N;      % ����CZT�Ĳ���f0,DELf��M
n2=f0:DELf:f0+(M-1)*DELf;    % ����CZT�е�Ƶ������
A=exp(1j*2*pi*f0/fs);        % ����A��W
W=exp(-1j*2*pi*DELf/fs); 
G=czt(s.*wind,M,W,A);        % CZT�任 
GX=abs(G)*4/N;               % ���CZT���Ƶ�׷�ֵ
[V,K]=findpeaks(GX,'minpeakheight',1);   % Ѱ��CZTƵ�׷�ֵ�ķ�ֵ����ʾ
ml=length(K);
for k=1 : ml
    fprintf('%5.2f   %5.2f\n',n2(K(k)),V(k));
end
% ZFFT
D=20; a=0.3;                 % ����ZFFT��ϸ������������ϵ��
M=round(4*D/a);              % �����˲����볤M
L=20480+2*M;                 % ������ݳ���
n=1:L;                       % ��������
t=(n-1)/fs;                  % ʱ������
% �����ź�����
s=3*cos(2*pi*f1*t)+4*cos(2*pi*f2*t+0.2)+5*cos(2*pi*f3*t+0.4);
fe=432;                      % ����Ƶ��
[y,freq]=zoomffta(s,fs,N,fe,D,a); % ZFFT
[V,K]=findpeaks(abs(y),'minpeakheight',1);   % Ѱ��ZFFTƵ�׷�ֵ�ķ�ֵ����ʾ
ml=length(K);
for k=1 : ml
    fprintf('%5.2f   %5.2f\n',freq(K(k)),V(k));
end
% ��ͼ
subplot 211; plot((n1-1)*df1,S(n1),'k');
title('FFT�õ���ȫ����ֵ��ͼ')
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
grid on; xlim([0 fs/2])
subplot 212; plot(n2,abs(GX),'k:',freq,abs(y),'k'); 
title('CZT��ZFFT�õ��ķ�ֵ��ͼ')
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
grid on; xlim([428 438]); hold on
set(gcf,'color','w');




