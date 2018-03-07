%
% pr5_1_5 
clear all; clc; close all;

fs=6400;                     % ����Ƶ��
t = 0:1/fs:0.7;              % ʱ��̶�
% ��ѹ�ݽ����ź�
y=220*cos(2*pi*50*t).*(t<0.2)+0.6*220*cos(2*pi*50*t).*...
    (t>=0.2&t<=0.4)+220*cos(2*pi*50*t).*(t>0.4);
wlen=640;                    % ÿ֡����
wind=hanning(wlen);          % ������
noverlay=wlen-64;            % ������֡����ص�������
% ��spectrogram��STFTƵ�׷���
[B,freq,time]=spectrogram(y,wind,noverlay,wlen,6400);
B=B*4/wlen;                  % �����źŵ�ʵ�ʷ�ֵ
df=fs/wlen;                  % ���Ƶ�ʼ��
%df=freq(2)-freq(1);          % ���Ƶ�ʼ��
nf1=floor(50/df)+1;          % 50Hz��Ӧ������������
nf2=floor(100/df)+1;         % 100Hz��Ӧ������������
nf3=floor(150/df)+1;         % 150Hz��Ӧ������������
nf4=floor(200/df)+1;         % 200Hz��Ӧ������������
nf5=floor(250/df)+1;         % 250Hz��Ӧ������������
nf6=floor(300/df)+1;         % 300Hz��Ӧ������������
% ��ͼ
figure(1);
subplot 211; plot(t,y,'k');
ylabel('��ֵ'); xlabel('ʱ��/s');
title('��ѹ�ݽ�ԭʼ����');
subplot 212; imagesc(time,freq,abs(B)); axis xy
xlabel('ʱ��/s'); ylabel('Ƶ��/Hz');
title('��ѹ�ݽ��ź�STFT��ͼ');
ylim([0 500]);
set(gcf,'color','w');
figure(2)
subplot 321; plot(time,abs(B(nf1,:)),'k'); 
xlim([0 max(time)]); ylabel('50Hz');
subplot 322; plot(time,abs(B(nf2,:)),'k'); 
axis([0 max(time) 0 10]); ylabel('100Hz');
subplot 323; plot(time,abs(B(nf3,:)),'k'); 
axis([0 max(time) 0 5]); ylabel('150Hz');
subplot 324; plot(time,abs(B(nf4,:)),'k'); 
axis([0 max(time) 0 5]); ylabel('200Hz');
subplot 325; plot(time,abs(B(nf5,:)),'k'); 
axis([0 max(time) 0 5]); ylabel('250Hz'); xlabel('ʱ��/s');
subplot 326; plot(time,abs(B(nf6,:)),'k'); 
axis([0 max(time) 0 5]); ylabel('300Hz'); xlabel('ʱ��/s');
set(gcf,'color','w');

