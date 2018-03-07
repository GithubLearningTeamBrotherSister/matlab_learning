%
% pr2_2_13 
clear all; clc; close all;

M=10; fs=10;                                    % �������ݳ���M�Ͳ���Ƶ��fs
f1=1; f2=2.5; f3=3;                             % ����3�������źŵ�Ƶ��
t=(0:M-1)/fs;                                   % ����ʱ������
x=cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t); % ������źŲ���

X1=fft(x);                                      % FFT�任
freq1=(0:5)*fs/10;                              % ����3���ź���Ƶ���Ƶ�ʿ̶�
X2=fft(x,40);                                   % FFT�任
freq2=(0:20)*fs/40;                             % ����3���ź���Ƶ���Ƶ�ʿ̶�
% ��ͼ
plot(freq1,abs(X1(1:6)),'k-.',freq2,abs(X2(1:21)),'k');
title('�����DFT�任');
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
legend('FFT�任��Ϊ10','FFT�任��Ϊ40')
set(gcf,'color','w');

