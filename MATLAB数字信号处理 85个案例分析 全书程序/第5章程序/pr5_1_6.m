%
% pr5_1_6 
clear all; clc; close all;

N=1024;                      % ���ݳ���
fs=1000;                     % ����Ƶ��
tt=(0:N-1)/fs;               % ʱ��̶�
x=chirp(tt,100,1,250);       % Chirp �ź�x
wlen=128;                    % ֡��
wind=hanning(wlen);          % ������
noverlap=wlen-1;             % �ص����ֳ���
% û��������,��STFTƵ��
[B,freq,time]=spectrogram(x,wind,noverlap,wlen,fs);
% ��������
L=wlen/2;                    % ���س���
p=10;                        % ����
y=forback_predictm(x,L,p);   % ǰ��������
% �������غ���STFTƵ��
[B1,freq,time1]=spectrogram(y,wind,noverlap,wlen,fs);
tt1=(0:N)/fs;                % ���غ�STFTƵ�׵�ʱ��̶�
% ��ͼ
figure(1)
plot(tt,x,'k'); xlim([0 max(tt)]);
xlabel('ʱ��/s'); ylabel('��ֵ');
title('��Ƶ�źŲ���ͼ')
set(gcf,'color','w');
figure(2)
subplot 211; imagesc(time,freq,abs(B)); axis xy;
xlabel('ʱ��/s'); ylabel('Ƶ��/Hz');
title('û����STFT��ͼ'); ylim([50 350]);
subplot 212; imagesc(tt1,freq,abs(B1)); axis xy;
xlabel('ʱ��/s'); ylabel('Ƶ��/Hz');
title('���غ�STFT��ͼ'); ylim([50 350]);
set(gcf,'color','w');
