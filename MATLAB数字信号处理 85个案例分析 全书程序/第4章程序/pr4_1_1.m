%
% pr4_1_1 
clear all; clc; close all;

load ecgdata2.mat                   % �����ĵ�ͼ����
N=length(y);                        % ���ݳ���
time=(0:N-1)/fs;                    % �����ʱ��̶�
[x,xtrend]=polydetrend(y, fs, 3);   % �ö���ʽ��Ϸ��������������������
% ��ͼ
subplot 311; plot(time,y,'k')
title('�����ĵ��ź�'); ylabel('��ֵ');
axis([0 max(time) -2000 6000]); grid;
subplot 312; plot(time,xtrend,'k','linewidth',1.5);
title('�������ź�'); ylabel('��ֵ');
axis([0 max(time) -2000 6000]); grid;
subplot 313; plot(time,x,'k'); 
title('�����������ĵ��ź�'); ylabel('��ֵ');
xlabel('ʱ��/s');
axis([0 max(time) -2000 6000]); grid;
set(gcf,'color','w');
