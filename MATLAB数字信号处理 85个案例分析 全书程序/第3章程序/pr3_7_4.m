%
% pr3_7_4 
clear all; clc; close all;

load bzsdata.mat                % ��������
N=length(bzs);                  % ԭʼ���ݳ�
t=(0:N-1)/Fs;                   % ����ʱ��

x=resample(bzs,1,5);            % ������
N1=length(x);                   % ��������ĳ���
fs=Fs/5;                        % ��������Ĳ���Ƶ��
fs2=fs/2;                       % �����������Ƶ�ʵ�һ��
t1=(0:N1-1)/fs;                 % ���������ʱ��̶�

fp1=[1.5 10];                   % ͨ��Ƶ��
fs1=[1 12];                     % ���Ƶ��
wp1=fp1/fs2;                    % ��һ��ͨ��Ƶ��
ws1=fs1/fs2;                    % ��һ�����Ƶ��
Ap=3; As=15;                    % ͨ�����ƺ����˥��
[n,Wn]=buttord(wp1,ws1,Ap,As);  % ���˲���ԭ�ͽ����ʹ���
[bn1,an1]=butter(n,Wn);         % �������˲���ϵ��
[H,f]=freqz(bn1,an1,1000,fs);   % �������˲�����Ƶ����

y1=filter(bn1,an1,x);           % �Խ�����������ݽ����˲�
y=resample(y1,5,1);             % ���˲�������ָ�ԭ����Ƶ��
% ��ͼ
figure(1)
subplot 311; plot(t,bzs,'k');
xlabel('ʱ��/��'); title('ԭʼ���ݲ���')
subplot 312; plot(t1,x,'k');
xlabel('ʱ��/��'); title('�����������ݲ���')
subplot 313; plot(t,y,'k')
xlabel('ʱ��/��'); title('�˲������ݲ���')
set(gcf,'color','w');
figure(2)
plot(f,abs(H),'k');
grid; axis([0 25 0 1.1]); 
xlabel('Ƶ��/Hz'); ylabel('��ֵ')
title('������˹�˲����ķ�ֵ��Ӧ')
set(gcf,'color','w');

