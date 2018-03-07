%
% pr2_2_7 
clear all; clc; close all

[x,fs]=wavread('sndwav1.wav');  % ��������
N=length(x);                    % ���ݸ���
time=(0:N-1)/fs;                % ʱ��̶�
p0=2e-5;                        % �ο���ѹ
nfft=2^nextpow2(N);             % ��FFT�ĸ�����չΪ2����������
n2=1:nfft/2+1;                  % ��Ƶ�ʵ�������
X = fft(x,nfft);                % FFT
freq = (0:nfft/2)*fs/nfft;      % ����Ƶ�ʿ̶�
X_abs=abs(X(n2))*2/N;           % �����ֵ
X_level=20*log10(X_abs/p0);     % ������ѹ��
% ��ͼ
subplot(211);
plot(time,x,'k');
xlabel('ʱ��/s'); ylabel('��ֵ/pa')
title('�źŵĲ���ͼ')
subplot 212; plot(freq/1000,X_level,'k');
xlabel('Ƶ��/kHz'); ylabel('��ѹ��/dB')
title('�źŵ���ѹ����ͼ'); axis([0 24 -35 35]);

