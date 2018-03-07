%
% pr3_13_8 
clear all; clc; close all;

Fs=10;                            % ����Ƶ��
fp1=1.5; fp2=2.5;                 % ͨ�������Ƶ��
fs1=1; fs2=3;
Rp=2; As=80;                      % ����Rp��As
wp1=2*fp1/Fs;wp2=2*fp2/Fs;        % ��һ����Ƶ��
ws1=2*fs1/Fs; ws2=2*fs2/Fs;
F=[ws1 wp1 wp2 ws2];              % ����Ƶ��ʸ��F
devp=(10^(Rp/20)-1)/(10^(Rp/20)+1); % ���㲨�ƺ�˥������ֵ
devs=10^(-As/20); 
dev=[devs devp devs];             % ����ƫ��ֵ
A=[0 1 0];                        % ���ô�ͨ����裬1Ϊ��ͨ��0Ϊ���� 

[N,F0,A0,W]=firpmord(F,A,dev,2);  % ����firpmord�����������
N=N+mod(N,2);                     % ��֤�˲�������Ϊż��
Acs=1;                            % Acs��ʼ��
dw=1/500;                         % ��Ƶ�ʷֱ���
ns1=floor(ws1/dw)-1;              % �����Ӧ������
ns2=floor(ws2/dw)+1; 
np1=floor(wp1/dw)-1;               % ͨ����Ӧ������
np2=floor(wp2/dw)+1;
wlip=np1:np2;                      % ͨ����������
wlis1=1:ns1;                       % �����������
wlis2=ns2:501;
while Acs>-As                      % ���˥��������������ѭ��
    h=firpm(N,F0,A0,W);            % ��firpm��������˲���
    [db, mag, pha, grd,w]=freqz_m(h,1);  % �����˲���Ƶ����Ӧ
    Acs1=max(db(wlis1));          % �����˥��ֵ
    Acs2=max(db(wlis2));
    Acs=max(Acs1,Acs2);
    fprintf('N=%4d   As=%5.2f\n',N,-Acs); % ��ʾ�˲���������˥��ֵ
    N=N+2;                        % ������2,��֤Ϊ��1���˲���
end
N=N-2;                            % ����Nֵ
[Hr,w,P,L,type] = ampl_ress(h);   % �����˲����������Ӧ
figure(2)
plot(w/pi*Fs/2,db,'k'); grid;
title('�Ȳ��ƴ�ͨ�˲����ķ�ֵ��Ӧ');
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB')
set(gcf,'color','w');
