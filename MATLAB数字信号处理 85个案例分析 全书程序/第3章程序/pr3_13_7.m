%
% pr3_13_7  
clear all; clc; close all;

Fs=2000;                          % ����Ƶ��
Fs2=Fs/2;                         % �ο�˹��Ƶ��
fp=200; fs=300;                   % ͨ�������Ƶ��
wp=fp*pi/Fs2; ws=fs*pi/Fs2;       % ͨ���������һ����Ƶ��
Rp=2; As=40;                      % ͨ�����ƺ����˥��
F=[wp ws]/pi;                     % �����˲�����Ƶ��ʸ��
A=[1,0];                          % �����˲����ķ�ֵʸ��
% ͨ�����ƺ����˥������ֵ
devp=(10^(Rp/20)-1)/(10^(Rp/20)+1); devs=10^(-As/20); 
dev=[devp,devs];                  % �������˲�����ƫ���ʸ��

[N,F0,A0,W]=firpmord(F,A,dev);    % ����firpmord�����������
N=N+mod(N,2);                     % ��֤�˲�������Ϊż��
Acs=1;                            % Acs��ʼ��
dw=pi/500;                        % ��Ƶ�ʷֱ���
ns1=floor(ws/dw)+1;               % ͨ����Ӧ������
np1=floor(wp/dw)-1;               % �����Ӧ������
wlip=1:np1;                       % ͨ����������
wlis=ns1:501;                     % �����������

while Acs>-As                     % ���˥��������������ѭ��
    h=firpm(N,F0,A0,W);           % ��firpm��������˲���
    [db, mag, pha, grd,w]=freqz_m(h,1);  % �����˲���Ƶ����Ӧ
    Acs=max(db(wlis));            % �����˥��ֵ
    fprintf('N=%4d   As=%5.2f\n',N,-Acs); % ��ʾ�˲���������˥��ֵ
    N=N+2;                        % ������2,��֤Ϊ��1���˲���
end
N=N-2;                            % ����Nֵ
[Hr,w,P,L,type] = ampl_ress(h);   % �����˲����������Ӧ
% ��ͼ
subplot 221; plot(w/pi*Fs2/1000,db,'k','linewidth',2); 
title('�Ȳ����˲�����ֵ��Ӧ'); 
xlabel('Ƶ��/kHz'); ylabel('��ֵ/dB')
grid; axis([0 1 -100 10]);
set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1])
set(gca,'YTickMode','manual','YTick',[-40,0])
L=0:N;
subplot 223; stem(L,h,'k'); axis([-1,N,-0.1,0.3]); grid;
title('�˲���������Ӧ');xlabel('����'); ylabel('��ֵ');
subplot 222; plot(w/pi*Fs2/1000,Hr,'k','linewidth',2);
title('�Ȳ����˲��������Ӧ');  grid;
xlabel('Ƶ��/kHz'); ylabel('���ֵ')
set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1])
set(gca,'YTickMode','manual','YTick',[0,0.89,1.11])
subplot 224; plot(wlip/500,Hr(wlip)-1,'k','linewidth',2); hold on
plot(wlis/500,Hr(wlis),'k','linewidth',2);
title('ͨ��������������ֵ'); 
xlabel('Ƶ��/kHz'); ylabel('���ֵ')
xlim([0 1]); grid;
set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1])
set(gca,'YTickMode','manual','YTick',[-0.11,-0.01,0,0.01,0.11]);
set(gcf,'color','w');


