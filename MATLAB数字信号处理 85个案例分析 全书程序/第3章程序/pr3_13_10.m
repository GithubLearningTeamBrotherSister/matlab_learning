%
% pr3_13_10 
clear all; clc; close all;

N=33;                            % �����˲�����
f=0:0.05:0.95;                   % ����Ƶ�ʵ�
a=f*pi;                          % ���ö�ӦƵ�ʵ�ķ�ֵ
b=firpm(N,f,a,'differentiator'); % �õȲ��Ʒ����
[db,mag,pha,grd,w]=freqz_m(b,1); % ��Ƶ����Ӧ
% ��ͼ
subplot 211; stem(b,'k');
title('΢������������Ӧ')
xlabel('����'); ylabel('��ֵ')
subplot 212; plot(w/pi,mag,'k','linewidth',2); 
grid; title('΢�����ķ�Ƶ����')
xlabel('��һ��Ƶ��'); ylabel('��ֵ')
set(gcf,'color','w');


