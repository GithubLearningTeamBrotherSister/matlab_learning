%
% pr4_5_1 from wn11
clear all; clc; close all;

xx=load('xnoisedata1.txt');     % ��������
time=xx(:,1);                   % ʱ������
x=xx(:,2);                      % ��������
xmean=mean5_3(x,1000000);            % ����mean5_3����,ƽ������
% ��ͼ
subplot 211; plot(time,x,'k');
xlabel('ʱ��/s'); ylabel('��ֵ')
title('ԭʼ����'); xlim([0 max(time)]);
subplot 212; plot(time,xmean,'k'); 
xlabel('ʱ��/s'); ylabel('��ֵ')
title('ƽ������������'); xlim([0 max(time)]);
set(gcf,'color','w');




