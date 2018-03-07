%
% pr2_1_5   
clear all; clc; close all;

fs = 2000;                      % ����Ƶ��
N = 40;                         % �źų���
n = 0:N-1;                      % ��������
f0 = 100; ph1=-pi/3;            % ��ʼƵ�ʺͳ�ʼ���
x=cos(2*pi*f0*n/fs+ph1);        % �����ź�����
X=fft(x);                       % FFT
d = ph1*fs/f0/(2*pi);           % ����λ����
Ex=exp(-1j*2*pi*n*d/N);         % ������ת����W^(-dk) 
X1 = X.*Ex;                     % FFT�����ת����
X1 = X1(1:N/2+1);               % ȡ��Ƶ�ʲ���
Y = [X1 conj(X1(end-1:-1:2))];  % ���ɹ���Գ�
y=ifft(Y);                      % FFT��任
y1=real(y);                     % ȡy��ʵ��
df = fs/N;                      % ����Ƶ�ʼ��
nk=floor(f0/df)+1;              % �ź���nk������
Y1=fft(y1);                     % ��y1��FFT
A=abs(real(Y1(nk)))*2/N;        % ����y1��ֵ
Theta=angle(Y1(nk));            % ����y1��ʼ���
fprintf('A=%5.2f   Theta=%5.6f\n',A,Theta)
% ��ͼ
subplot 311; plot(n,x,'k'); 
axis([0 N -1.1 1.1]); 
title('ԭʼ�ź�'); ylabel('��ֵ');
subplot 312; plot(n,real(y),'k'); 
axis([0 N -1.1 1.1]); 
title('λ�ƺ��ź�y��ʵ��'); ylabel('��ֵ'); 
subplot 313; plot(n,imag(y),'k');
title('λ�ƺ��ź�y���鲿'); ylabel('��ֵ'); xlabel('����'); 
set(gcf,'color','w')


