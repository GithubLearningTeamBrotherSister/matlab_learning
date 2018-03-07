%
% pr3_13_9 
clear all; clc; close all;

Fs=2000;                               % ����Ƶ��
Fs2=Fs/2;                              % �ο�˹��Ƶ��
% �˲�������Ƶ�ʵ�ֵ
fc1=220; fc2=260; fc3=340; fc4=380; fc5=520;
fc6=560; fc7=640; fc8=680; fc9=820; fc10=860;
rp=1; as=40;                           % ͨ�����ƺ����˥�� 
% ��һ����Ƶ��ֵ
Fc=[fc1 fc2 fc3 fc4 fc5 fc6 fc7 fc8 fc9 fc10]/Fs2;
% fir2��
f=[0 Fc 1];                            % ���������˲�����Ƶ��ʸ��
a=[0 0 1 1 0 0 1 1 0 0 1 1];           % ���������˲����ķ�ֵʸ��
dw=(fc3-fc2)*pi/Fs2;                   % ��һ���Ĺ��ɴ�ֵ
N1=ceil(6.6*pi/dw);                    % ���㺣����ʱ�˲����Ľ���
N1=N1+mod(N1,2);                       % ��֤�˲�������Ϊż��
b=fir2(N1,f,a);                        % ��fir2��������˲���ϵ��
[db1,mag1,pha1,grd1,w1]=freqz_m(b,1);  % ����˲���Ƶ����Ӧ
% �Ȳ��Ʒ�
A=[0 1 0 1 0 1];                       % ���ɷ�ֵʸ��
devp=(10^(rp/20)-1)/(10^(rp/20)+1);    % ���ͨ����ƫ��ֵ
devs=10^(-as/20);                      % ��������ƫ��ֵ
dev=[devs devp devs devp devs devp];   % �����˲�������е�ƫ��ʸ��
[N2,F0,A0,W]=firpmord(Fc,A,dev);       % ��firpmord����˲����Ľ���
N2=N2+mod(N2,2);                       % ��֤�˲�������Ϊż��
df=Fs2/500;                            % Ƶ��ֱ���
ns1=ceil(fc1/df)+1;                    % fc1��Ӧ������ֵ
wlis=1:ns1;                            % �����������
Acs=1;                                 % Acs��ʼֵ
while Acs>-as                          % ���˥��������������ѭ��
    h=firpm(N2,F0,A0,W);               % ��firpm��������˲���
    [db2, mag2, pha2, grd2,w2]=freqz_m(h,1);  % �����˲���Ƶ����Ӧ
    Acs=max(db2(wlis));                % �����˥��ֵ
    fprintf('N=%4d   As=%5.2f\n',N2,-Acs); % ��ʾ�˲���������˥��ֵ
    N2=N2+2;                           % ������2,��֤Ϊ��1���˲���
end
N2=N2-2;                               % ����N2ֵ
% ��ͼ
subplot 211; plot(w1/pi*Fs2,db1,'k','linewidth',2)
grid; axis([0 1000 -80 10]);
set(gca,'XTickMode','manual','XTick',[0 220 260 340 380 520 560 640 680 820 860 1000])
set(gca,'YTickMode','manual','YTick',[-40,0])
title('(a)fir2��������˲�����ֵ��Ӧ'); 
xlabel('Ƶ��/kHz'); ylabel('��ֵ/dB')
subplot 212; plot(w2/pi*Fs2,db2,'k','linewidth',2)
grid; axis([0 1000 -80 10]);
set(gca,'XTickMode','manual','XTick',[0 220 260 340 380 520 560 640 680 820 860 1000])
set(gca,'YTickMode','manual','YTick',[-40,0])
title('(b)�Ȳ��Ʒ�����˲�����ֵ��Ӧ'); 
xlabel('Ƶ��/kHz'); ylabel('��ֵ/dB')
set(gcf,'color','w');




