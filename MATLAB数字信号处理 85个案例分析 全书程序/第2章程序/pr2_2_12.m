%
% pr2_2_12 
clear all; clc; close all;

fs=200;                            % ����Ƶ��
f1=30; f2=65.5;                    % ���ź�Ƶ��
N=200;                             % �źų���
n=1:N;                             % ��������
t=(n-1)/fs;                        % ʱ��̶�
x=cos(2*pi*f1*t)+cos(2*pi*f2*t);   % �ź�

X1=fft(x);                         % ��N�����FFT
freq1=(0:N/2)*fs/N;                % N��ʱ��Ƶ�ʿ̶�
X1_abs=abs(X1(1:N/2+1))*2/N;       % �źŷ�ֵ

L=2*N;                             % �����FFT����
X2=fft(x,L);                       % ��L������FFT
freq2=(0:L/2)*fs/L;                % L��ʱƵ�ʿ̶�
X2_abs=abs(X2(1:L/2+1))*2/N;       % �źŷ�ֵ
% ��ͼ
subplot 211; plot(freq1,X1_abs,'k'); 
grid; ylim([0 1.2]);
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
title('(a) ����ǰFFT��ͼ')
subplot 212; plot(freq2,X2_abs,'k');
grid; ylim([0 1.2]);
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
title('(b) �����FFT��ͼ')
set(gcf,'color','w');
