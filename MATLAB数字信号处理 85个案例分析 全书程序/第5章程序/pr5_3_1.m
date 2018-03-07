%
% pr5_3_1 
clear all; clc; close all;

fs=2048;                     % ����Ƶ��
N=4096;                      % �źų���
df1=fs/N;                    % �ֱ���
n=1:N;                       % ��������
t=(n-1)/fs;                  % ʱ������
f1=431.1; f2=433.3;          % �ź�Ƶ��
s=3*cos(2*pi*f1*t)+5*cos(2*pi*f2*t-0.4); % �����ź�����
wind=hanning(N)';            % ������
S=abs(fft(s.*wind))*4/N;     % FFT�����ֵ
n1=1:N/2;                    % ��Ƶ�ʲ�������
fre1=(n1-1)*fs/N;            % FFT�任�����Ƶ�ʿ̶�
[V,K]=findpeaks(S(n1),'minpeakheight',1);   % Ѱ��FFTƵ�׷�ֵ�ķ�ֵ����ʾ
fprintf('%5.2f   %5.2f   %5.2f   %5.2f\n',fre1(K(1)),V(1),fre1(K(2)),V(2))
% CZT
f0=428; DELf=0.01; M=N/4;    % ����CZT�Ĳ���f0,DELf��M
n2=f0:DELf:f0+(M-1)*DELf;    % ����CZT�е�Ƶ������
A=exp(1j*2*pi*f0/fs);        % ����A��W
W=exp(-1j*2*pi*DELf/fs);
G=czt(s.*wind,M,W,A);        % CZT�任
GX=abs(G)*4/N;               % ���CZT���Ƶ�׷�ֵ
[V,K]=findpeaks(GX,'minpeakheight',1);   % Ѱ��CZTƵ�׷�ֵ�ķ�ֵ����ʾ
fprintf('%5.2f   %5.2f   %5.2f   %5.2f\n',n2(K(1)),V(1),n2(K(2)),V(2))
% ��ͼ
subplot 211; plot((n1-1)*df1,S(n1),'k');
title('FFT�õ���ȫ����ֵ��ͼ')
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
grid on; xlim([0 fs/2])

subplot 212; plot(n2,abs(GX),'k'); 
title('CZT�õ��ķ�ֵ��ͼ')
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
grid on; xlim([428 438]); hold on
stem(n2(K(1)),V(1),'k');
stem(n2(K(2)),V(2),'k');
set(gcf,'color','w');


