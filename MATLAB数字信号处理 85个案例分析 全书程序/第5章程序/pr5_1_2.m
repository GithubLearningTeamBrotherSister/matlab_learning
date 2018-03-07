%
% pr5_1_2 
clear all; clc; close all;

fs=1000;                     % ����Ƶ��
tt=(0:1000)'/fs;             % ʱ��̶�
% �����ź�
x=sin(2*pi*400*tt).*(tt<=0.3)+sin(2*pi*200*tt).*(tt>0.3&tt<=0.6)+...
    sin(2*pi*100*tt).*(tt>0.6&tt<=0.8)+sin(2*pi*50*tt).*(tt>0.8);

N=length(x);                 % ���ݳ���
nfft=256;                    % ����nfft
n3=1:128;                    % ������Ƶ�ʲ���
h=hamming(31);                     % ���ô���Ϊ31
[tfr1,t,f1]=tfrstft(x,1:N,nfft,h); % STFT
h=hamming(63);                     % ���ô���Ϊ63
[tfr2,t,f2]=tfrstft(x,1:N,nfft,h); % STFT
h=hamming(127);                    % ���ô���Ϊ127
[tfr3,t,f3]=tfrstft(x,1:N,nfft,h); % STFT
h=hamming(255);                    % ���ô���Ϊ255
[tfr4,t,f4]=tfrstft(x,1:N,nfft,h); % STFT
% ��ͼ
figure(1)
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1), pos(2)-100,pos(3),(pos(4)-180)]);
plot(tt,x,'k');
xlabel('ʱ��/s'); ylabel('��ֵ'); title('�źŲ���ͼ')
set(gcf,'color','w');
figure(2)
subplot 221; contour(tt,f1(n3)*fs,abs(tfr1(n3,:)));
set(gca, 'YTickmode', 'manual', 'YTick', [0,50,100,200,400,500]);
grid; title('����=31'); ylabel('Ƶ��/Hz'); xlabel('ʱ��/s');
subplot 222; contour(tt,f2(n3)*fs,abs(tfr2(n3,:)));
set(gca, 'YTickmode', 'manual', 'YTick', [0,50,100,200,400,500]);
grid; title('����=63'); ylabel('Ƶ��/Hz'); xlabel('ʱ��/s');
subplot 223; contour(tt,f3(n3)*fs,abs(tfr3(n3,:)));
set(gca, 'YTickmode', 'manual', 'YTick', [0,50,100,200,400,500]);
grid; title('����=127'); ylabel('Ƶ��/Hz'); xlabel('ʱ��/s');
subplot 224; contour(tt,f4(n3)*fs,abs(tfr4(n3,:)));
set(gca, 'YTickmode', 'manual', 'YTick', [0,50,100,200,400,500]);
grid; title('����=255'); ylabel('Ƶ��/Hz'); xlabel('ʱ��/s');
set(gcf,'color','w');



