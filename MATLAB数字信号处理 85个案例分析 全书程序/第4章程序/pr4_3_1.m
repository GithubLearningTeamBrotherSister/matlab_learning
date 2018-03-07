%
% pr4_3_1
clear all; clc; close all;

n=-5000:20:5000;            % ��������
% �����һ����:ֱ������ϣ�����ر任
N=length(n);                % �ź�������
nt=0:N-1;                   % �����������к�
x=120+96*exp(-(n/1500).^2).*cos(2*pi*n/600); % �����ź�
Hx=hilbert(x);              % ϣ�����ر任
% ��ͼ
plot(nt,x,'k',nt,abs(Hx),'r');
grid; legend('�ź�','����');
xlabel('����'); ylabel('��ֵ')
title('�źźͰ���')
set(gcf,'color','w');
pause

% ����ڶ�����:����ֱ������ϣ�����ر任
y=x-120;                    % ����ֱ������
Hy=hilbert(y);              % ϣ�����ر任
% ��ͼ
figure(2)
plot(nt,y,'k',nt,abs(Hy),'r');
grid; legend('�ź�','����');
xlabel('����'); ylabel('��ֵ')
title('�źźͰ���')
set(gcf,'color','w');
figure(3);
plot(nt,x,'k',nt,abs(Hy)+120,'r');
grid; legend('�ź�','����'); hold on;
xlabel('����'); ylabel('��ֵ')
title('�źźͰ���')
set(gcf,'color','w');
pause

% �����������:ͨ��Ƶ����ϣ�����ر任
y_fft=fft(y);               % FFT
y_hit(1)=y_fft(1);          % ��ʽ(4-3-11)����y_hit
y_hit(2:(N+1)/2)=2*y_fft(2:(N+1)/2);
y_hit((N+1)/2+1:N)=0;
z=ifft(y_hit);              % ��y_hit��IFFT
% ��ͼ
figure(4)
subplot 211; plot(n,real(Hy),'r',n,real(z),'g');
xlabel('����'); ylabel('��ֵ'); legend('ʱ��','Ƶ��')
title('Ƶ���ʱ��ϣ�����ر任ʵ���Ƚ�');
subplot 212; plot(n,imag(Hy),'r',n,imag(z),'g');
xlabel('����'); ylabel('��ֵ'); legend('ʱ��','Ƶ��')
title('Ƶ���ʱ��ϣ�����ر任�鲿�Ƚ�');set(gcf,'color','w');

figure(5)
plot(nt,x,'k',nt,abs(z)+120,'r');
grid; legend('�ź�','����');
xlabel('����'); ylabel('��ֵ')
title('�źźͰ���')
set(gcf,'color','w');

