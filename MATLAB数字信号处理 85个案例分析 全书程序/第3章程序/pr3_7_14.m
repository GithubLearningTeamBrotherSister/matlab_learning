%
% pr3_7_14 
clear all; close all; clc;

load ydata1.mat                 % ��������
Fs=400; Fs2=Fs/2;               % ���ò���Ƶ�ʺ��ο�˹��Ƶ��
y=double(y);                      % ǿ������ת��
N=length(y);                    % ���ݳ���
t=(0:N-1)/Fs;                   % ʱ��̶�

fp=20; fs=30;                   % ͨ�������Ƶ��
Rp=2; Rs=40;                    % ͨ�����ƺ����˥��
Wp=fp/Fs2; Ws=fs/Fs2;           % ͨ�������Ƶ�ʹ�һ��
[M,Wn]=cheb2ord(Wp,Ws,Rp,Rs);   % �����˲�������
[bn,an]=cheby2(M,Rs,Wn);        % ����˲���ϵ��
% ��1�ַ��� 
x1=filter(bn,an,y);             % ��1���˲�
x2=flipud(x1);                  % ʱ�����ݷ�ת����
y2=filter(bn,an,x2);            % ��2���˲�
y1=flipud(y2);                  % ʱ��������һ�η�ת����
% ��2�ַ��� 
yy=filtfilt(bn,an,y);           % ��filtfilt������������λ�˲�
% ��ͼ
plot(t,y,'r','linewidth',2); hold on
plot(t,x1,'k--','linewidth',2);
plot(t,y1,'k','linewidth',2);
legend('ԭʼ����','��1��ͨ���˲������','��2��ͨ���˲������');
xlabel('ʱ��/s'); ylabel('��ֵ');
title('ԭʼ���ݼ�����ͨ���˲���������ݵĲ���ͼ')
set(gcf,'color','w');
figure(2)
line([t],[y1],'color',[.6 .6 .6],'linewidth',3); hold on
plot(t,yy,'k--','linewidth',2);
legend('��1�ַ��������','��2�ַ��������');
xlabel('ʱ��/s'); ylabel('��ֵ');
title('��������λ�˲����ıȽ�')
box on; set(gcf,'color','w');


