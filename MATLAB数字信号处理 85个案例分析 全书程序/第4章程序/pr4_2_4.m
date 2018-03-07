%
% pr4_2_4 
clear all; clc; close all;

load Evnespecdata.mat                  % ��������Ƶ�װ����ļ�
[Val1,Loc1]=findpeaks(spect);          % ��findpeaks��ȡ�������Ϣ
df=freq(2)-freq(1);                    % ���Ƶ�ʼ��
FRMNT1=(Loc1-1)*df;                    % ��������Ƶ��
% ��ʾ�������Ϣ
fprintf('%5.4f   %5.4f   %5.4f   %5.4f\n',Val1);
fprintf('%5.2f   %5.2f   %5.2f   %5.2f\n',FRMNT1);

[Loc2,Val2]=findpeakm(spect,'q');      % ��findpeakm��ȡ�������Ϣ
FRMNT2=(Loc2-1)*df;                    % ��������Ƶ��
% ��ʾ�������Ϣ
fprintf('%5.4f   %5.4f   %5.4f   %5.4f\n',Val2);
fprintf('%5.2f   %5.2f   %5.2f   %5.2f\n',FRMNT2);
% ��ͼ
plot(freq,spect,'k','linewidth',2); 
hold on; grid; ylim([-6 1]);
for k=1 : 4
    plot(FRMNT1(k),Val1(k),'rO','linewidth',3.5);
    plot(FRMNT2(k),Val2(k),'kO','linewidth',3.5);
end
title('ͨ���ڲ����������Ƶ��')
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB');
set(gcf,'color','w');



