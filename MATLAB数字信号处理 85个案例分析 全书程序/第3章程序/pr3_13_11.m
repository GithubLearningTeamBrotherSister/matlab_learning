%
% pr3_13_11
clear all; clc; close all;

N=50;                                % �����˲�����
M=N+1;                               % ϣ�����ر任����
f = [0.05,0.95];                     % ����Ƶ�ʵ�
a = [1 1];                           % ���ö�ӦƵ�ʵ�ķ�ֵ
h = firpm(N,f,a,'hilbert');          % �õȲ��Ʒ����
[db,mag,pha,grd,w]=freqz_m(h,[1]);   % ��Ƶ����Ӧ
% ��ͼ
subplot(1,1,1)
subplot(2,1,1); stem([0:N],h,'k'); 
title('ϣ�����ر任����������Ӧ')
xlabel('����'); ylabel('��ֵ')
axis([0,N,-0.8,0.8])
set(gca,'XTickMode','manual','XTick',[0,N])
set(gca,'YTickMode','manual','YTick',[-0.8:0.2:0.8]);
subplot(2,1,2); plot(w/pi,mag,'k','linewidth',2); 
grid; title('ϣ�����ر任���ķ�Ƶ����')
xlabel('��һ��Ƶ��'); ylabel('��ֵ')
set(gca,'XTickMode','manual','XTick',[0,f,1])
set(gca,'YTickMode','manual','YTick',[0,1]);
set(gcf,'color','w');
