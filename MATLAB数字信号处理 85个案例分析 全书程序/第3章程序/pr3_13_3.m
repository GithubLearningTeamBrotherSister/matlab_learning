%
% pr3_13_3 
clear all; clc; close all

Fs=100;                                 % ����Ƶ��
Fs2=Fs/2;                               % �ο�˹��Ƶ��
fp=3; fs=5;                             % ͨ�������Ƶ��
Rp=3; As=50;                            % ͨ�����ƺ����˥��
delta1 = (10^(Rp/20)-1)/(10^(Rp/20)+1); % ��ͨ����������ֵ
delta2 = (1+delta1)*(10^(-As/20));      % �����˥������ֵ
f=[fp fs]/Fs2; A=[1 0];                 % ����Ƶ��ָ��f�ͷ�ֵָ��A
dev=[delta1 delta2];                    % ����ƫ��ָ��dev
[N,Wn,beta,ftype] = kaiserord(f,A,dev); % ��kaiserord���������������������
N=N+rem(N,2);                           % ��֤�˲���ϵ����N+1Ϊ����
b=fir1(N,Wn,kaiser(N+1,beta));          % ��fir1�������󴰺������FIR��1���˲���
[db,mag,phs,gdy,w]=freqz_m(b,1);        % �����˲���Ƶ����Ӧ
% ��ͼ
subplot 211; plot(w*Fs/(2*pi),db,'k','linewidth',2);
title('��ͨ�˲�����ֵ��Ӧ');
grid; axis([0 20 -70 10]); 
xlabel('Ƶ��/Hz');  ylabel('��ֵ/dB')
set(gca,'XTickMode','manual','XTick',[0,3,5,20])
set(gca,'YTickMode','manual','YTick',[-50,0])
subplot 212; stem(1:N+1,b,'k');
title('��ͨ�˲���������Ӧ');
xlabel('����');  ylabel('��ֵ')
axis([0 N+1 -0.05 0.1]); %grid;
set(gca,'XTickMode','manual','XTick',[1,(N+2)/2,N+1])
set(gcf,'color','w');

