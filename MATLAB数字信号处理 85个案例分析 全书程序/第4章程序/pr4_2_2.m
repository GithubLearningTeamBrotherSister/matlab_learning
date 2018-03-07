%
% pr4_2_2 
clear all; clc; close all;

load SDqdata2.mat                      % �����ź�
y=-mix_signal;                         % �������źŷ���
% �źŷ������findpeaks��������ֵ�����ֵ�ļ��
[Val,Locs]=findpeaks(y,'MINPEAKHEIGHT',-1400,'MINPEAKDISTANCE',5);
b0=interp1(time(Locs),-Val,time);      % �����ֵ,���ɻ���ƫ������
x=-y-b0;                               % ������ƽ���ź�
% ��ͼ 
subplot 211; plot(time,y,'k'); hold on; grid
plot(time(Locs),Val,'r.','linewidth',3);
xlabel('ʱ��/s'); ylabel('��ֵ'); 
title('���źŵߵ�������Ѱ�ҷ�ֵ���Ѱ�ҹ�ֵ'); 
subplot 212; plot(time,x,'k');
xlabel('ʱ��/s'); ylabel('��ֵ');
title('�ѻ�����ƽ��Ĳ���ͼ'); grid;
set(gcf,'color','w');




