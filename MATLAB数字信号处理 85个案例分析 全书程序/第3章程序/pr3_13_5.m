%
% pr3_13_5 
clear all; clc; close all;

% �źŹ���
N=100;                                    % ���ݳ�
Fs=100;                                   % ����Ƶ��
Fs2=Fs/2;                                 % �ο�˹��Ƶ��
f1=5; f2=20;                              % �������ź�Ƶ��
phy1=pi/4; phy2=pi/3;                     % �������źų�ʼ��λ��
t=(0:N-1)/Fs;                             % ʱ��̶�
x=cos(2*pi*f1*t+phy1)+cos(2*pi*f2*t+phy2);% ���������ź� 
% FIR��ͨ�˲������
fp=10; fs=15;                             % ͨ�������Ƶ��
Rp=3; As=60;                              % ͨ�����ƺ����˥��
wp=fp*pi/Fs2; ws=fs*pi/Fs2;               % ��һ����Ƶ��
deltaw= ws - wp;                          % ���ɴ����صļ���
M = ceil(11*pi/ deltaw);                  % �����������������˲�������M
M = M + mod(M,2);                         % ��֤�˲���ϵ����M+1Ϊ����
wind = (blackman(M+1))';                  % ��������������
Wn=(fp+fs)/Fs;                            % �����ֹƵ��
b=fir1(M,Wn,wind);                        % ��fir1�������FIR��1���˲���
[db,mag,phs,gdy,w]=freqz_m(b,1);          % �����˲�����Ӧ
% �ź��˲�
y1=filter(b,1,x);                         % ��filter���������˲�
y2=conv(b,x);                             % ��conv���������˲�
y21=y2(M/2+1:M/2+N);                      % ȡy2�е���Ч����
N2=length(y2);                            % ��y2����
t2=(0:N2-1)/Fs;                           % y2��ʱ��̶�
% ��ͼ
figure(1)
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1), pos(2)-100,pos(3),(pos(4)-160)]);
plot(w/pi*Fs2,db,'k')
title('��ͨ�˲����ķ�ֵ��Ӧ');
grid; axis([0 Fs2 -150 10]); 
xlabel('Ƶ��/Hz');  ylabel('��ֵ/dB')
set(gca,'XTickMode','manual','XTick',[0,10,15,20,50])
set(gca,'YTickMode','manual','YTick',[-100,-60,0])
set(gcf,'color','w');
figure(2)
subplot 311; plot(t,y1,'k');
ylim([-1.1 1.1]);
title('(a)ͨ��filter����FIR�˲��������');
xlabel('ʱ��/s'); ylabel('��ֵ')
subplot 312; plot(t2,y2,'k');
ylim([-1.1 1.1]);
title('(b)ͨ��conv����FIR�˲��������');
xlabel('ʱ��/s'); ylabel('��ֵ')
subplot 313; plot(t,y21,'k');
ylim([-1.1 1.1]);
title('(c)��(b)�������������');
xlabel('ʱ��/s'); ylabel('��ֵ')
set(gcf,'color','w');


