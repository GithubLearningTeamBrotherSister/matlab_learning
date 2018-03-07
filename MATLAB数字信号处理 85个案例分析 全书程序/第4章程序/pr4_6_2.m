%
% pr4_6_2 from hsb122
clear all; clc; close all;

Fs=1000;                     % ����Ƶ��
N=251;                       % ������
t=(0:N-1)/Fs;                % ʱ��̶�

f1=10; f2=21;                % �ź�Ƶ��f1��f2
L=20;                        % ���س���
ys=sin(2*pi*f1*t)+sin(2*pi*f2*t);  % �����ź�
yc=cos(2*pi*f1*t)+cos(2*pi*f2*t);  % �����ź�
x1=forback_predictm(ys,L,4);        % ����
hys=hilbert(ys);             % ��û������ʱ��ϣ�����ر任
hx1=hilbert(x1);             % �����غ����е�ϣ�����ر任
hys1=hx1(L+1:L+N);           % ��ȥ���ص�����
% ��ͼ
subplot 311; plot(t,ys,'k'); 
axis([0 max(t) -2.4 2.4]); ylabel('ԭʼ�ź�')
subplot 312; plot(t,yc,'r','linewidth',3); hold on
plot(t,-imag(hys),'k'); axis([0 max(t) -2.4 2.4]);
ylabel('δ�����صı任')
subplot 313; plot(t,yc,'r','linewidth',3); hold on
plot(t,-imag(hys1),'k'); axis([0 max(t) -2.4 2.4]);
ylabel('�����صı任'); xlabel('ʱ��/s')
set(gcf,'color','w');


