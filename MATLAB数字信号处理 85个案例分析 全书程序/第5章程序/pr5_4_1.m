%
% pr5_4_1
clear all; clc; close all;

A=input('��������,С������*�ű�ʾ,��#�Ž���:','s');
% �����һ����
fs=8000;                     % ����Ƶ��
dth=0.05;                    % DTMF���ε�ʱ�䳤��
Doption=1;                   % ����ʾ����
x=gendtmfcs(A,dth,Doption);  % ����gendtmfcs��������DTMF����
B=goertzel_decode(x,0.1);    % Ӧ��Goertzel�㷨����
fprintf('%s\n',B);           % ��ʾ��������ַ���

pause(1);
% ����ڶ�����
SNR=10;                      % ���������
y=TouchToneDialler(A,SNR);   % ����TouchToneDialler������������DTMF����
B=goertzel_decode(y,1);      % Ӧ��Goertzel�㷨����
fprintf('%s\n',B);           % ��ʾ��������ַ���
N=length(y);
time=(0:N-1)/fs;             % ʱ��̶�
% ��ͼ
figure(1)
plot(time,y,'k'); grid;
line([0 max(time)],[1 1],'color','r');
xlim([0 max(time)]);
xlabel('ʱ��/s'); ylabel('��ֵ')
set(gcf,'color','w');
wavplay(y,fs);

