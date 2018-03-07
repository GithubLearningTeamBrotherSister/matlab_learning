%
% pr3_7_3 
clear all; close all; clc;

[y,Fs]=wavread('San2.wav');        % ��������
fc=3400;fb=3700;                   % ����ͨ���������ֹƵ��
Rp=3;Rs=60;                        % ����ͨ�����ƺ����˥��
wp=2*pi*fc/Fs;ws=2*pi*fb/Fs;       % �����һ��Ƶ��
Ts=1/Fs;
Wp=2/Ts*tan(wp/2.);Ws=2/Ts*tan(ws/2.);% ģ��Ƶ�ʽ���Ԥ��
[M,Wn]=ellipord(Wp,Ws,Rp,Rs,'s');   % �õ�ģ���˲���ԭ�ͽ����ʹ���
[bs,as]=ellip(M,Rp,Rs,Wn,'s');      % �õ�ģ���˲���ϵ��
[b,a]=bilinear(bs,as,Fs);           % ˫����Z�任�������˲���ϵ��

x=filter(b,a,y);                    % �����ݽ����˲�
Y=fft(y);                           % �����������źŵ���ͼ
X=fft(x);
N=length(x);
n2=1:N/2;
freq=(n2-1)*Fs/N;
% ��ͼ
[H,ff]=freqz(b,a,1000,Fs);          % �۲������˲�������Ӧ����
plot(ff,20*log10(abs(H)),'k');
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB')
title('��Բ�˲�����Ƶ��Ӧ����'); 
ylim([-80 10]); grid;
set(gcf,'color','w');
figure
subplot 211; plot(freq,abs(Y(n2)),'k'); % �����ź���ͼ
xlabel('Ƶ��/Hz'); title('�����ź���ͼ')
subplot 212; plot(freq,abs(X(n2)),'k'); % ����ź���ͼ
xlabel('Ƶ��/Hz'); title('����ź���ͼ')
set(gcf,'color','w');

