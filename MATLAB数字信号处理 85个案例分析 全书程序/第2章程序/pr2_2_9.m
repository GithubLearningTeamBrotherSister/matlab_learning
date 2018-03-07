%
% pr2_2_9 
clear all; clc; close all;

fs=1000;                         % ����Ƶ��
N=1000;                          % �źų���
t=(0:N-1)/fs;                    % ����ʱ������
f1=50; f2=65.75;                 % ���ź�Ƶ��
x=cos(2*pi*f1*t)+cos(2*pi*f2*t); % �����ź�
wind=hanning(N)';
X=fft(x.*wind);                  % �˴�������FFT
Y=abs(X)*2/1000;                 % �����ֵ
freq=fs*(0:N/2)/1000;            % ����Ƶ�ʿ̶�
[A1, k1]=max(Y(45:65));          % Ѱ���1���źŵķ�ֵ
k1=k1+44;                        % ����������
[A2, k2]=max(Y(60:70));          % Ѱ���1���źŵķ�ֵ
k2=k2+59;                        % ����������
Theta1=angle(X(k1));             % �����ź�f1�ĳ�ʼ���
Theta2=angle(X(k2));             % �����ź�f2�ĳ�ʼ���
Y1=Y*2;                          % �ԼӴ���ķ�ֵ��������
% ��ʾƵ�ʺͷ�ֵ
fprintf('f1=%5.2f   A1=%5.4f   A11=%5.4f   Theta1=%5.4f\n',freq(k1),A1,A1*2,Theta1); 
fprintf('f2=%5.2f   A2=%5.4f   A21=%5.4f   Theta2=%5.4f\n',freq(k2),A2,A2*2,Theta2);

% ��ͼ
subplot 211; plot(freq,Y(1:N/2+1),'k'); xlim([40 75]); 
line([0 100],[.5 .5],'color','k');
xlabel('Ƶ��/Hz'); ylabel('��ֵ'); title('(a)Ƶ��ͼ-��ֵ����ǰ');
subplot 212; plot(freq,Y1(1:N/2+1),'k'); xlim([40 75]); 
line([0 100],[1 1],'color','k');
xlabel('Ƶ��/Hz'); ylabel('��ֵ'); title('(b)Ƶ��ͼ-��ֵ������');
set(gcf,'color','w');

