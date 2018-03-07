%
% pr4_5_3 from zw21
clear all; clc; close all;

t=0:.2:199;            % ����ʱ������
s=10*sin(0.4*pi*t);    % ԭʼ�ź�
ns=randn(size(s));     % ������������
y=s+ns;                % ���ɴ����ź�
x=sgolayfilt(y,3,19);  % ͨ��Savitzky-Golay�˲���
% ��ͼ
figure
plot(t,y,'r'); 
xlim([0 20]); hold on; grid;
plot(t,x,'k');
xlabel('ʱ��'); ylabel('��ֵ');
title('Savitzky-Golay�˲�������/�������ͼ')
set(gcf,'color','w');
