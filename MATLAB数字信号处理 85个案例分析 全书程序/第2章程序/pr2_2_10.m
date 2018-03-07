%
% pr2_2_10  
clear all; clc; close all;

M=256; fs=10;                                   % �������ݳ���M�Ͳ���Ƶ��fs
f1=1; f2=2.5; f3=3;                             % ����3�������źŵ�Ƶ��
t=(0:M-1)/fs;                                   % ����ʱ������
x=cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t); % ������źŲ���

X1=fft(x,20);                                   % FFT�任
X2=fft(x,40);
X3=fft(x,128);
freq1=(0:10)*fs/20;                              % ����3���ź���Ƶ���Ƶ�ʿ̶�
freq2=(0:20)*fs/40;
freq3=(0:64)*fs/128;
% ��ͼ
plot(freq1,abs(X1(1:11)),'k',freq2,abs(X2(1:21)),'k',freq3,abs(X3(1:65)),'k');
%legend('N=20','N=40','N=128');
title('��ͬNֵ��DFT�任');
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
set(gcf,'color','w');

