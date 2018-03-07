%
% pr2_2_11  
clear all; clc; close all;

f1=50; a1=311.46;                        % ���õ�1��������Ƶ�����ֵ
f2=46; a2=1.57;                          % ���õ�2��������Ƶ�����ֵ
N=12000;                                 % �������ݳ���N
fs=8000;                                 % ���ò���Ƶ��fs
t=(0:N-1)/fs;                            % ����ʱ��̶�
x=a1*cos(2*pi*f1*t)+a2*cos(2*pi*f2*t);   % �����ź�
freq=(0:N/2)*fs/N;                       % ����Ƶ�ʿ̶�
wind=blackman(N)';                       % ������������������
X=fft(x.*wind);                          % FFT
plot(freq,20*log10(abs(X(1:N/2+1))),'k');% ��ͼ
grid; xlim([0 100])
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB');
title('�ź���ͼ');
set(gcf,'color','w');

