%
% pr5_1_1 
clear all; clc; close all;

N=1024;                      % ���ݳ���
fs=1000;                     % ����Ƶ��
tt=(0:N-1)/fs;               % ʱ��̶�
x1=chirp(tt,0,1,350);        % Chirp �ź�x1
x2=chirp(tt,350,1,0);        % Chirp �ź�x2
x=x1'+x2';                   % ����Chirp �ź���ӣ�
win=hanning(127);            % ������
[B,t,f]=tfrstft(x,1:N,N,win);% ��ʱ����Ҷ�任
% ��ͼ
figure(1)                    % �źŲ���ͼ
subplot 211; plot(tt,x1,'k');
title(' Chirp�ź�x1')
xlabel('ʱ��/s'); ylabel('��ֵ')
xlim([0 max(tt)]);
subplot 212; plot(tt,x2,'k');
title(' Chirp�ź�x2')
xlabel('ʱ��/s'); ylabel('��ֵ')
xlim([0 max(tt)]);
set(gcf,'color','w');
figure(2)                    % ��mesh����άͼ
mesh(tt,f(1:N/2)*fs,abs(B(1:N/2,:)));
xlabel('ʱ��/s'); ylabel('Ƶ��')
title('��Ƶ�ź�STFT����άͼ')
axis([0 max(tt) 0 500 0 6]);
set(gcf,'color','w');
figure(3)                    % ��mesh����άͼ
mesh(tt,f(1:N/2)*fs,abs(B(1:N/2,:)));
%mesh(tt,f*fs,abs(B));
view(0,90); xlim([0 max(tt)])
xlabel('ʱ��/s'); ylabel('Ƶ��')
title('��Ƶ�ź�STFT�Ķ�άͼ')
set(gcf,'color','w');
figure(4)                    % ��contour���ȸ���ͼ
contour(tt,f(1:N/2)*fs,abs(B(1:N/2,:)),256);
xlabel('ʱ��/s'); ylabel('Ƶ��')
title('��Ƶ�ź�STFT�ĵȸ���ͼ')
set(gcf,'color','w');
figure(5)                    % ��imagesc����άͼ
imagesc(tt,f(1:N/2)*fs,abs(B(1:N/2,:))); axis xy
xlabel('ʱ��/s'); ylabel('Ƶ��')
title('��Ƶ�ź�STFT��Ƶ��ͼ')
set(gcf,'color','w');









  