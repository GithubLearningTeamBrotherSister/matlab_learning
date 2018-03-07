% 
% pr3_13_4 
clear all; clc; close all

Fs=250;                                      % ����Ƶ��
Fs2=Fs/2;                                    % �ο�˹��Ƶ��
fp1=45; fs1=49;                              % ͨ�������Ƶ��
fs2=51; fp2=55; 
wp1 = fp1*pi/Fs2; ws1 = fs1*pi/Fs2;          % ͨ���������һ����Ƶ��
ws2 = fs2*pi/Fs2; wp2 = fp2*pi/Fs2; 
As = 20;                                     % �趨���˥��
tr_width = min((ws1-wp1),(wp2-ws2));         % ���ɴ����صļ���
M = ceil(6.2*pi/tr_width);                   % ������������������˲�������M
M=M+mod(M,2);                                % ��֤�˲���ϵ����M+1Ϊ����
fc1 = (ws1+wp1)/2/pi; fc2 = (wp2+ws2)/2/pi;  % ���ֹƵ�ʵĹ�һ��ֵ

% ��fir1����
h1 = fir1(M,[fc1 fc2],'stop',hanning(M+1)'); % ��fir1�������������˲���������Ӧ
[db1,mag,pha,grd,w1] = freqz_m(h1,[1]);      % ���Ƶ����Ӧ
% ��ͼ
plot(w1*Fs2/pi,db1,'k'); 
title('FIR�ݲ�����ֵ��Ӧ');grid;
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB')
axis([0 Fs2 -60 10]); hold on
set(gca,'XTickMode','manual','XTick',[0,45,50,55,125])
set(gca,'YTickMode','manual','YTick',[-40,-20,0])
set(gcf,'color','w');

