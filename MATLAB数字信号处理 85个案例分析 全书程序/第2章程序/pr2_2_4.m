%
% pr2_2_4 
clear all; clc; close all;

fs=1000;                       % ����Ƶ��
f0=50;                         % �ź�Ƶ��
A=1;                           % �źŷ�ֵ
theta0=pi/3;                   % �źų�ʼ���
N=1000;                        % �źų���
t=(0:N-1)/fs;                  % ����ʱ������
x=A*cos(2*pi*f0*t+theta0);     % �����ź�
X=fft(x);                      % FFT
n2=1:N/2+1;                    % ��������������
freq=(n2-1)*fs/N;              % ����Ƶ�ʿ̶�
% ��һ����
THETA=angle(X(n2));            % �����ʼ���
Am=abs(X(n2));                 % �����ֵ
ph0=THETA(51);                 % �����źŵĳ�ʼ���
fprintf('ph0=%5.4e   %5.4e   %5.4e\n',real(X(51)),imag(X(51)),ph0);
% ��ͼ
subplot 211; plot(freq,abs(X(n2))*2/N,'k');
xlabel('Ƶ��/Hz'); ylabel('��ֵ')
title('��ֵ��ͼ')
subplot 212; plot(freq,THETA,'k')
xlabel('Ƶ��/Hz'); ylabel('��ʼ��/����')
title('��λ��ͼ')
set(gcf,'color','w');
pause
% �ڶ�����
Th=0.1;                        % ������ֵ
thetadex=find(Am<Th);          % Ѱ��С����ֵ���������ߵ�����
THETA1=THETA;                  % ��ʼ��THETA1
THETA1(thetadex)=0;            % ����С����ֵ���������߳�ʼ��λ��Ϊ0
% ��ͼ
figure
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1), pos(2)-100,pos(3),(pos(4)-160)]);
plot(freq,THETA1,'k')
xlabel('Ƶ��/Hz'); ylabel('��ʼ��/����')
title('��λ��ͼ')
set(gcf,'color','w');



