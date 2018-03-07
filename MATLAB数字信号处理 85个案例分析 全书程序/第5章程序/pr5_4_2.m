%
% pr5_4_2
clear all; clc; close all;

[x1,fs1]=wavread('PhoneNumberA_2013.wav'); % ����PhoneNumberA_2013.wav
x1=x1-mean(x1);
B=goertzel_decode(x1,0.15);                % Ӧ��Goertzel�㷨����
fprintf('%s\n',B);                         % ��ʾ��������ַ���
N1=length(x1);                             % x1�ĳ���
time1=(0:N1-1)/fs1;                        % x1��ʱ��̶�

[x2,fs2]=wavread('PhoneNumberB_2013.wav'); % ����PhoneNumberB_2013.wav
x2=x2-mean(x2);
B=goertzel_decode(x2,0.05);                % Ӧ��Goertzel�㷨����
fprintf('%s\n',B);                         % ��ʾ��������ַ���
N2=length(x2);                             % x1�ĳ���
time2=(0:N2-1)/fs2;                        % x1��ʱ��̶�
% ��ͼ
subplot 211; plot(time1,x1,'k');
xlabel('ʱ��/s'); ylabel('��ֵ'); 
title('PhoneNumberA-2013���ݵĲ���ͼ');
grid; xlim([0 max(time1)]);
subplot 212; plot(time2,x2,'k');
xlabel('ʱ��/s'); ylabel('��ֵ'); 
title('PhoneNumber-2013���ݵĲ���ͼ');
grid; xlim([0 max(time2)]);
set(gcf,'color','w');



