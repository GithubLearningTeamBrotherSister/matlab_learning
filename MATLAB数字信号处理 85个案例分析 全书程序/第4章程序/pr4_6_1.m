%
% pr4_6_1 
clear all; clc; close all

N = 1000;                    % ���ݳ���
Fs = 1000;                   % ����Ƶ��
t = (0:N-1)/Fs;              % ʱ��̶�
% �˲������
fp=[3 15];                   % �˲���ͨ����������趨
fs = [0.5 30];
rp = 1.5;                    % ͨ������
rs = 20;                     % ���˥��
wp = fp*2/Fs;                % ��һ��Ƶ��
ws = fs*2/Fs;
[n,wn]=buttord(wp,ws,rp,rs); % �����˲�������
[b,a] = butter(n,wn);        % �����˲���ϵ��
[h,w] = freqz(b,a,1000,Fs);  % ���˲�����Ӧ
h = 20*log10(abs(h));        % �����˲�����ֵ��Ӧ 

%�źŵĲ���
f1 = 0.001;                  % ����1,׼ֱ��
f2 = 5;                      % ����2,�����ź�
f3 = 50;                     % ����3,��Ƶ����
x1 = 100+10*sin(2*pi*f1*t);  % ����3���������ź�
x2 = 10*sin(2*pi*f2*t);
x3 = 10*sin(2*pi*f3*t);
xn = x1+x2+x3;               % �ϲ�Ϊ�ź�xn
y1=filtfilt(b,a,xn);         % ������λ��ͨ�˲�
Segma1=var(y1-x2);           % ���㷽��
L=400;                       % �������س���
yn=forback_predictm(xn,L,10);% ǰ��������
ynt = filtfilt(b,a,yn);      % ������λ��ͨ�˲�
y2 = ynt((L+1):(L+N));       % ��ȥ���ز���
Segma2=var(y2'-x2);          % ���㷽��
fprintf('Segma1=%5.4f   Segma2=%5.4f\n',Segma1,Segma2);
% ��ͼ
figure(1)
plot(w,h,'k');
grid; axis([0 50 -50 10]);
title('������˹�˲�����ֵ����')
ylabel('��ֵ/dB');xlabel('Ƶ��/Hz');
set(gcf,'color','w');
figure(2)
n=1:N;
subplot 311; plot(n,xn,'k'); 
grid; ylabel('ԭʼ�ź�')
subplot 312; plot(n,x2,'r','linewidth',3); hold on;
plot(n,y1,'k'); grid;
ylabel('δ�����ص����')
subplot 313; plot(n,x2,'r','linewidth',3); hold on;
plot(n,y2,'k'); grid;   xlabel('����')
ylabel('�����ص����')
set(gcf,'color','w');

