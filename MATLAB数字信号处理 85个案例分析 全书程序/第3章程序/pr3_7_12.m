%
% pr3_7_12 
clear all; clc; close all;

load('noisyecg.mat');              % �����ź����ݺͲ���Ƶ��
x=noisyecg;                        % �ź�Ϊx
N=length(x);                       % �źų�N
t =(0:N-1)./fs;                    % ʱ��̶� 
fs2=fs/2;                          % �����ο�˹��Ƶ��
W0=50/fs2;                         % �ݲ�������Ƶ��
BW=0.1;                            % �ݲ������� 
[b,a]=iirnotch(W0,BW);             % ���IIR�����ݲ���
[H,w]=freqz(b,a);                  % ����˲�����Ƶ����Ӧ
y=filter(b,a,x);                   % ���ź��˲�
% ��ͼ
plot(w*fs/2/pi,20*log10(abs(H)),'k');
xlabel('Ƶ��/Hs'); ylabel('��ֵ/dB');
title('�ݲ�����ֵ��Ӧͼ')
axis([0 125 -45 5]); grid;
set(gca,'XTickMode','manual','XTick',[0,40,50,60,100])
set(gca,'YTickMode','manual','YTick',[-40,-30,-20,-10,0])
set(gcf,'color','w');
figure(2)
subplot 211; plot(t,x,'k','linewidth',2);
xlabel('ʱ��/s'); ylabel('��ֵ');
title('�����ĵ粨��ͼ')
subplot 212; plot(t,y,'k');
xlabel('ʱ��/s'); ylabel('��ֵ');
title('������ĵ粨��ͼ')
set(gcf,'color','w');

%save ntchdata1.mat w H b a
b
a