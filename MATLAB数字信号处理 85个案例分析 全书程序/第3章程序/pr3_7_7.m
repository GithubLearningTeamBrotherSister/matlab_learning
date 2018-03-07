% 
% pr3_7_7 
clear all; clc; close all;

K=1.74802;                           % K(r)�еĲ���ֵ 
w1=2*pi*9.15494;
w2=2*pi*2.27979;
w3=2*pi*1.22535;
w4=2*pi*21.9;
lemda=2*pi*4.05981;
Fs=400;                              % ����Ƶ��
% ��K(r)�еĸ�����ֵתΪ2����ϵͳ��ϵ��
b(1)=K*w1; b(2)=0;                   % ��1��ϵͳ����
a(1)=1/w2; a(2)=1;                   % ��2��ϵͳ����
c(1)=1; c(2)=2*lemda; c(3)=w1*w1;    % ��1��ϵͳ��ĸ
d(1)=1/w3/w4; d(2)=1/w3+1/w4; d(3)=1;% ��1��ϵͳ��ĸ

B=conv(b,a);                         % ���ģ��ϵͳ�ķ��ӵ�ϵ��
A=conv(c,d);                         % ���ģ��ϵͳ�ķ�ĸ��ϵ��
[Hs,whs]=freqs(B,A);                 % ��ģ��ϵͳ��Ӧ����

[num,den]=bilinear(B,A,Fs);          % ˫����Z�任�������ϵͳ�ķ��Ӻͷ�ĸϵ��
[Hz,wz]=freqz(num,den);              % ������ϵͳ��Ӧ����
% ��ͼ
plot(whs/2/pi,abs(Hs),'k:','linewidth',2)
axis([0 30  0 1.2]); box on; hold on
plot(wz/pi*Fs/2,abs(Hz),'k','linewidth',2);
title('K(s)ģ����Ӧ���ߺ�������Ӧ���߱Ƚ�');
xlabel('Ƶ��/Hz'); ylabel('��ֵ')
legend('ģ��ϵͳ','����ϵͳ');
set(gcf,'color','w');

