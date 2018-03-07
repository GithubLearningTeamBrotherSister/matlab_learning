%
% pr2_2_15 
clear all; clc; close all;

xx=load('delaydata1.txt');% ��������
x=xx(:,1);               % ��Ϊx
y=xx(:,2);               % ��Ϊy
N=length(x);             % ���ݳ���
[Rxy,lags]=xcorr(y,x);   % ��xcorr�����������
% ���ټ����������
X=fft(x,2*N);            % FFT
Y=fft(y,2*N);            % FFT
Sxy=Y.*conj(X);
sxy=ifftshift(ifft(Sxy));% IFFT,������������
Cxy=sxy(2:end);          % ֻȡ2*N-1��
% ��ͼ
subplot 211; 
line([lags],[Rxy],'color',[.6 .6 .6],'linewidth',3); hold on
plot(lags,Cxy,'k'); axis([-100 100 -50 200]);
box on; title('(a) ���ַ����õ�x��y���������')
xlabel('����'); ylabel('��غ�����ֵ')
legend('xcorr','�����������',2)
% ����ѭ�����
Xc=fft(x);               % FFT
Yc=fft(y);               % FFT
Scxy=Yc.*conj(Xc);
scxy=ifftshift(ifft(Scxy));% IFFT,������������
Ccxy=scxy(2:end);        % ֻȡN-1��
lagc=-N/2+1:N/2-1;       % �����ӳ�����
% ��ͼ
subplot 212; plot(lagc,Ccxy,'k'); 
axis([-100 100 -50 200]); title('(b) x��y��ѭ�����')
xlabel('����'); ylabel('��غ�����ֵ')
set(gcf,'color','w')
