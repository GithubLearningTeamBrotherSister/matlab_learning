%
% pr2_2_5 
clear all; clc; close all;

load qldata.mat                  % ��������
N=length(y);                     % ���ݳ���
time=(0:N-1)/fs;                 % ʱ��̶�
% ��һ����
Y=fft(y);                        % FFT
n2=1:N/2+1;                      % ȡ��Ƶ����������
freq=(n2-1)*fs/N;                % Ƶ�ʿ̶�
% ��ͼ
subplot 211; plot(time,y,'k'); ylim([0 15]); grid;
title('�������������')
xlabel('ʱ��/s'); ylabel('��ֵ');
subplot 212; plot(freq,abs(Y(n2)),'k')
title('�������������Ƶ��')
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
set(gcf,'color','w');
pause
% �ڶ�����
x=detrend(y);                    % ����������
X=fft(x);                        % FFT
% ��ͼ
figure
subplot 211; plot(time,x,'k'); ylim([-5 5]); grid;
title('����������������')
xlabel('ʱ��/s'); ylabel('��ֵ');
subplot 212; plot(freq,abs(X(n2)),'k');
title('����������������Ƶ��')
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
set(gcf,'color','w');


