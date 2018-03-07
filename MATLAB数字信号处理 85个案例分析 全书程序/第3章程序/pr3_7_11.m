%
% pr3_7_11 
clear all; clc; close all;

fs=1600;                             % ����Ƶ��
f0=50;                               % ����Ƶ��
N=800;                               % ���ݳ���
t=(0:N-1)/fs;                        % ʱ��̶�
x=zeros(1,N);                        % x��ʼ��
for k=1 : 2 : 10                     % �����ź�
    x=x+(10/pi/k)*sin(2*pi*k*f0*t);  
end

fs2=fs/2;                            % �ο�˹��Ƶ��
wp=[40 60]/fs2; ws=[30 80]/fs2;      % ͨ�������
Rp=1; Rs=40;                         % ͨ�����ƺ����˥��
[M,Wn]=ellipord(wp,ws,Rp,Rs);        % ��ԭ���˲��������ʹ���
[B,A]=ellip(M,Rp,Rs,Wn);             % �������˲���ϵ��
x1=x(1:400); x2=x(401:800);          % �������ڵ���������
% ��һ����-��filter����������zi��zf����
y1=filter(B,A,x1);                   % �ֱ�����������˲�
y2=filter(B,A,x2);
y=[y1 y2];                           % ���������ϲ����������
% ��ͼ
figure(1)
subplot 211; plot(t,x,'k');
title('�����źŲ���');
xlabel('ʱ��/s'); ylabel('��ֵ');
subplot 212; plot(t,y,'k');
title('����zi��zf����filter������źŲ���');
xlabel('ʱ��/s'); ylabel('��ֵ');
set(gcf,'color','w');

% �ڶ�����-��filter������ʹ��zi��zf����
zi=zeros(6,1);                       % ��ʼ��
[u1,zf]=filter(B,A,x1,zi);           % �ֱ�����������˲�
zi=zf;
[u2,zf]=filter(B,A,x2,zi);
u=[u1 u2];                           % ���������ϲ����������
% ��ͼ
figure(2)
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1), pos(2)-100,pos(3),(pos(4)-200)]);
plot(t,u,'k');
title('��zi��zf����filter������źŲ���');
xlabel('ʱ��/s'); ylabel('��ֵ');
set(gcf,'color','w');

