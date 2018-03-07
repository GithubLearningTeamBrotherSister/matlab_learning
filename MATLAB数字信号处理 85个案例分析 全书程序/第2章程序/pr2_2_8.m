%
% pr2_2_8 
clear all; clc; close all;

fs=128;                         % ����Ƶ��
% ��һ����
N=128;                          % �źų���
t=(0:N-1)/fs;                   % ʱ������
y=cos(2*pi*30*t);               % �����ź�
Y=fft(y,N);                     % FFT
freq=(0:N/2)*fs/N;              % ��ʽ(2-2-7)����Ƶ�ʿ̶�
n2=1:N/2+1;                     % ������Ƶ�ʵ�������
Y_abs=abs(Y(n2))*2/N;           % ������Ƶ�ʲ��ֵ�Ƶ�׷�ֵ
% ��ͼ
subplot 211; stem(freq,Y_abs,'k')
xlabel('Ƶ��(Hz)'); ylabel('��ֵ');
title('(a) Fs=128Hz, N=128')
axis([10 50 0 1.2]); 

% �ڶ�����
N1=100;                           % �źų���
t1=(0:N1-1)/fs;                   % ʱ������
y1=cos(2*pi*30*t1);               % �����ź�
Y1=fft(y1,N1);                    % FFT
freq1=(0:N1/2)*fs/N1;             % ��ʽ(2-2-7)����Ƶ�ʿ̶�
n2=1:N1/2+1;                      % ������Ƶ�ʵ�������
Y_abs1=abs(Y1(n2))*2/N1;          % ������Ƶ�ʲ��ֵ�Ƶ�׷�ֵ
% ��ͼ
subplot 212; stem(freq1,Y_abs1,'k')
xlabel('Ƶ��(Hz)'); ylabel('��ֵ');
title('(b) Fs=128Hz, N=100')
axis([10 50 0 1.2]); hold on
line([30 30],[0 1],'color',[.6 .6 .6],'linestyle','--');
plot(30,1,'ko','linewidth',5)
set(gcf,'color','w');
