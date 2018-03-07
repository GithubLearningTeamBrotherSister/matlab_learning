%
% pr4_3_2 
clear all; clc; close all;

xx=load('pulsedata0.txt');   % �����ź�
N=length(xx);                % ���ݳ���
n=1:N;                       % ������������
% ��ͼ
plot(n,xx,'k'); grid;
xlabel('����'); ylabel('��ֵ');
title('ԭʼ�źŲ���ͼ')
set(gcf,'color','w');

% �����һ������hilbert�����źŵİ���
xm=sum(xx)/N;                % �����źŵ�ֱ������
x=xx-xm;                     % ����ֱ������
z=hilbert(x);                % ����ϣ�����ر任
% ��ͼ
figure(2)
plot(n,x,'k'); hold on; grid;
plot(n,abs(z),'r');
xlabel('����'); ylabel('��ֵ');
title('����ֱ����������ȡ��������ͼ')
set(gcf,'color','w');

% ����ڶ��������󼫴�Сֵ�����źŵİ��� 
% ����findpeakm���������źŵļ���Сֵ
[K1,V1]=findpeakm(x,[],120); % �󼫴�ֵλ�úͷ�ֵ
up=spline(K1,V1,n);          % �ڲ�,��ȡ�ϰ�������
[K2,V2]=findpeakm(x,'v',120);% ��Сֵλ�úͷ�ֵ
down=spline(K2,V2,n);        % �ڲ�,��ȡ�°�������
% ��ͼ
figure(3)
plot(n,x,'k'); hold on; grid;
plot(n,up,'r');
plot(n,down,'r');
xlabel('����'); ylabel('��ֵ');
title('����ȡ����Сֵ������ȡ��������ͼ')
set(gcf,'color','w');

