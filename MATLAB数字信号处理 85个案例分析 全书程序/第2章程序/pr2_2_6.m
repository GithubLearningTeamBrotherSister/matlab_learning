%
% pr2_2_6 
clear all; clc; close all;

load sndata1.mat            % ��������
X=fft(y);                   % FFT
n2=1:L/2+1;                 % ������Ƶ��������
freq=(n2-1)*fs/L;           % Ƶ�ʿ̶�
% ��һ����
% ���Է�ֵ��ͼ
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1), pos(2)-100,pos(3),(pos(4)-140)]);
plot(freq,abs(X(n2)),'k'); grid
xlabel('Ƶ��/Hz'); ylabel('��ֵ')
title('���Է�ֵ')
set(gcf,'color','w');
pause
% �ڶ�����
% �ö���������ͼ
figure
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1), pos(2)-100,pos(3),(pos(4)-140)]);
semilogy(freq,abs(X(n2)),'k'); grid;
xlabel('Ƶ��/Hz'); ylabel('��ֵ')
title('���������ֵ'); hold on
set(gcf,'color','w');
% ����ֱ�ֵ��ͼ
figure
X_db=20*log10(abs(X(n2)));
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1), pos(2)-100,pos(3),(pos(4)-140)]);
plot(freq,X_db,'k'); grid;
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB')
title('�ֱ���ֵ'); hold on
set(gcf,'color','w');


