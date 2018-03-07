%
% pr2_1_4 
clear all; clc; close all;

fs = 2000;                      % ����Ƶ��
N = 40;                         % �źų���
n = 0:N-1;                      % ��������
f0 = 100; ph1=-pi/3;            % ��ʼƵ�ʺͳ�ʼ���
x=cos(2*pi*f0*n/fs+ph1)        % �����ź�����
x1=hilbert(x)                  % ����hilbert�任
X=fft(x1);                      % FFT
d = ph1*fs/f0/(2*pi);           % ����λ����
Ex=exp(-1j*2*pi*n*d/N);         % ������ת����W^(dk) 
Y = X.*Ex;                      % FFT�����ת����
y=ifft(Y);                      % FFT��任
y1=real(y);                     % ȡ��ʵ��
Y1=fft(y1);                     % FFT
df = fs/N;                      % ����Ƶ�ʼ��
nk=f0/df+1;                     % �ź���nk������
A=abs(real(Y1(nk)))*2/N;        % �����ֵ
Theta=angle(Y1(nk));            % �����ʼ���
fprintf('A=%5.2f   Theta=%5.6f\n',A,Theta)
% ��ͼ
subplot 211; plot(n,x,'k'); 
axis([0 N -1.1 1.1]); 
title('ԭʼ�ź�'); ylabel('��ֵ'); xlabel('����'); 
subplot 212; plot(n,y1,'k'); 
axis([0 N -1.1 1.1]); 
title('λ�ƺ��źŵ�ʵ��'); ylabel('��ֵ'); xlabel('����'); 
set(gcf,'color','w')



