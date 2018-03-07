%
% pr3_7_6  
clear all; clc; close all;

fp=[100 200]; fs=[50 250];       % ���������˲�����ͨ�������
Fs=1000;                         % ����Ƶ��
Rp=2; Rs=40;                     % ����ͨ���Ĳ��ƺ������˥��
wp=2*fp*pi; ws=2*fs*pi;          % ��ͨ�����������ɽ�Ƶ��
[N,Wn]=cheb2ord(wp,ws,Rp,Rs,'s');% ����ģ���˲����Ľ����ʹ���
[Bs,As]=cheby2(N,Rs,Wn,'s');     % ����ģ���˲���ϵ��
[Hs,w]=freqs(Bs,As);             % ����ģ���˲�������Ӧ����
[Bz,Az]=bilinear(Bs,As,1000);    % ͨ��˫����Z�任ת���������˲���ϵ��
[Hz,fz]=freqz(Bz,Az,1000,Fs);    % ���������˲�������Ӧ����
% ��ͼ
line(w/2/pi,20*log10(abs(Hs)),'color',[.6 .6 .6],'linewidth',3);
grid; axis([0 500 -60 5]); hold on
plot(fz,20*log10(abs(Hz)),'k');
legend('ģ���˲���','�����˲���')
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB');
title('������Ԥ���������˲�����ģ���˲�����Ӧ���߱Ƚ�')
set(gcf,'color','w'); box on
 

