%
% pr2_2_14 
clear all; clc; close all;

N=256;                         % ������             
x=boxcar(N);                   % ���þ��δ�
% ��һ����
X1=fft(x);                     % FFT
X1_abs=abs(fftshift(X1));      % �����ֵ
freq1=(-128:127)/N;            % Ƶ�ʿ̶�1
subplot 311; plot(freq1,X1_abs,'k');      % ��ͼ
xlim([-0.1 0.1]);
xlabel('��һ��Ƶ��'); ylabel('��ֵ');
title('(a) ����ǰFFT��ͼ')
% �ڶ�����
X2=fft(x,N*8);                 % �Ծ��δ������FFT
X2_abs=abs(fftshift(X2));      % �����ֵ
freq2=(-N*4:N*4-1)/(N*8);      % Ƶ�ʿ̶�2
subplot 312; plot(freq2,X2_abs,'k');      % ��ͼ
xlim([-0.1 0.1]);
xlabel('��һ��Ƶ��'); ylabel('��ֵ');
title('(b) �����FFT��ͼ')
X2_dB=20*log10(X2_abs/(max(X2_abs))+eps); % ��ֵȡ�ֱ�ֵ
subplot 313; plot(freq2,X2_dB,'k');       % ��ͼ
axis([0 0.1 -50 5]);
xlabel('��һ��Ƶ��'); ylabel('��ֵ/dB');
title('(c) �����FFT��ͼ-�ֱ�ֵ')
set(gcf,'color','w');

