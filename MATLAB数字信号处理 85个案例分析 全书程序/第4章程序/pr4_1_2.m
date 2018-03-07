%
% pr4_1_2
clear all; clc; close all;

load ecgdata2.mat                   % �����ĵ�ͼ����
N=length(y);                        % ���ݳ���
time=(0:N-1)/fs;                    % �����ʱ��̶�
y1=sgolayfilt(y,3,1001);            % ��sgolay�˲������������
x=y-y1;                             % ��������������������
% ��ͼ
subplot 311; plot(time,y,'k')
title('�����ĵ��ź�'); ylabel('��ֵ');
axis([0 max(time) -2000 6000]); grid;
subplot 312; plot(time,y1,'k','linewidth',1.5);
title('�������ź�'); ylabel('��ֵ');
axis([0 max(time) -2000 6000]); grid;
subplot 313; plot(time,x,'k'); 
title('�����������ĵ��ź�'); ylabel('��ֵ');
xlabel('ʱ��/s');
axis([0 max(time) -2000 6000]); grid;
set(gcf,'color','w');
