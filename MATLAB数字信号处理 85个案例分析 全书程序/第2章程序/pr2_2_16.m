%
% pr2_2_16 
clear all; clc; close all;

xx=load('delaydata3.txt');% ��������
x=xx(:,1);               % ��Ϊx
y=xx(:,2);               % ��Ϊy
N=length(x);             % ���ݳ���
fs=1000;                 % ����Ƶ��
Xc=fft(x);               % FFT
Yc=fft(y);               % FFT
Scxy=Yc.*conj(Xc);       % ����ѭ�����
scxy=ifftshift(ifft(Scxy));
Ccxy=scxy(2:end);        % ѭ����غ���
lagc=-N/2+1:N/2-1;       % �ӳ����̶�
% ��ͼ
subplot 211; plot(lagc,Ccxy,'k'); 
title('(a) x��y��ѭ�����');
xlabel('����'); ylabel('��غ�����ֵ')

[Rxy,lags]=xcorr(y,x);   % �����������
% ��ͼ
subplot 212; plot(lags,Rxy,'k');
title('(b) x��y���������')
xlabel('����'); ylabel('��غ�����ֵ')
set(gcf,'color','w')

