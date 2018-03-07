%
% pr2_2_1 
clear all; clc; close all;

fs=128;                         % ����Ƶ��
N=128;                          % �źų���
t=(0:N-1)/fs;                   % ʱ������
y=cos(2*pi*30*t);               % �����ź�
y=fft(y,N);                     % FFT
freq=(0:N/2)*fs/N;              % ��ʽ(2-2-6c)������Ƶ�ʿ̶� 
% ��ͼ
stem(freq,abs(y(1:N/2+1)),'k')
xlabel('Ƶ��(Hz)'); ylabel('��ֵ');
title('(b) ֻ����Ƶ�ʿ̶�')
xlim([25 35]);
set(gcf,'color','w');

