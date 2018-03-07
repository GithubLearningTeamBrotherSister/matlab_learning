%
% pr5_2_1 
clear all; clc; close all;

N=640;                       % ���ݳ��� 
fs=200;                      % ����Ƶ��
t=(0:N-1)/fs;                % ʱ��̶�
% �����ź�����
x=10*sin(2*pi*32*t)+10*sin(2*pi*50*t)+20*sin(2*pi*54*t)+...
    20*sin(2*pi*56*t)+30*sin(2*pi*59*t)+20*sin(2*pi*83*t);

nfft=64;                     % FFT����
X=fft(x,nfft);               % FFT����
ff=(0:(nfft/2-1))*fs/nfft;   % Ƶ�ʿ̶�
n2=1:nfft/2;                 % ��Ƶ��������
X_abs=abs(X(n2))*2/nfft;     % ��Ƶ�ʲ��ֵķ�ֵ��
fe=55;                       % ����Ƶ��
D=10;                        % ϸ������
[y,freq]=exzfft_ma(x,fe,fs,nfft,D);  % ϸ������
% ��ͼ
figure(1)
subplot 311; plot(t,x,'k');
xlabel('ʱ��/s'); ylabel('��ֵ');
xlim([0 1]); title('ʱ������');
subplot 312; plot(ff,X_abs,'k');
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
title('ϸ������ǰƵ��'); grid;
subplot 313; plot(freq,abs(y),'k'); grid;
set(gca, 'XTickMode', 'manual', 'XTick', [50,54,56,59]);
set(gca, 'YTickMode', 'manual', 'YTick', [10,20,30]);
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
title('ϸ��������Ƶ��');
set(gcf,'color','w');
figure(2)
plot(ff,X_abs,'k--');  hold on
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
plot(freq,abs(y),'k'); grid; ylim([0 32]);
legend('ϸ������ǰ��Ƶ��','ϸ��������Ƶ')
title('ϸ������ǰ��Ƶ����ϸ������Ƶ�׵Ķ���');
set(gca, 'XTickMode', 'manual', 'XTick', [32,50,54,56,59,83]);
set(gca, 'YTickMode', 'manual', 'YTick', [10,20,30]);
set(gcf,'color','w');
