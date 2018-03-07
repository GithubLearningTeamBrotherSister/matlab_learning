%  
% pr3_13_6  
clear all; clc; close all;

Fs=2000;                                    % ����Ƶ��
Fs2=Fs/2;                                   % �ο�˹��Ƶ��
fc1=150; fc2=250; fc3=350;                  % ��Ƶ���Ƶ��ֵ
fc4=500; fc5=600; fc6=700;                  
fd=[0 fc1 fc2 fc3 fc4 fc5 fc6 800 Fs2]/Fs2;	% ��Ƶ�ʵ㹹��Ƶ��ʸ��
Hd=[0 1 1 0.5 0.5 0.25 0.25 0 0];			% ��Ӧ��Ƶ��������ֵ
dw=(fc3-fc2)*pi/Fs2;                        % ������ɴ��� 
N=ceil(11*pi/dw);                           % �����˲������� 
wind=blackman(N+1)';                        % �������������� 
hn=fir2(N, fd, Hd, wind);				    % ��fir2�������˲���ϵ��
[H, f] = freqz(hn, 1, 512, Fs);			    % ���˲�������Ӧ
% ��ͼ
plot(f, abs(H),'k','linewidth',2), 
xlabel('Ƶ��/Hz'); ylabel('��ֵ');
title('һ��Ƶ�������Ȩ�����ķ�ֵ��Ӧ����')
set(gca,'XTickMode','manual','XTick',[0,150,250,350,500,600,700,800])
set(gca,'YTickMode','manual','YTick',[0.25,0.5,1])
grid on; ylim([0 1.2]);
set(gcf,'color','w');

