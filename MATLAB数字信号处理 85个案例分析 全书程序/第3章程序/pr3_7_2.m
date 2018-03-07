%
% pr3_7_2 
clear all; close all; clc;

fp=100; fs=200;                  % ����ͨ�������
Fs=1000;                         % ����Ƶ��
Rp=2; Rs=40;                     % ͨ�����ƺ����˥��
wp=fp*2*pi/Fs;                   % ��ͨ���������Ϊ��Ƶ��
ws=fs*2*pi/Fs;
T=1;                             % T=1
Ts=1/Fs;                         % Ts=1/Fs
Wp=2/Ts*tan(wp/2);               % ��ͨ���������Fs����Ԥ��
Ws=2/Ts*tan(ws/2);
[N,Wn]=cheb1ord(Wp,Ws,Rp,Rs,'s');% ��ԭ��ģ���ͨ�˲����Ľ����ʹ��� 
[bs,as]=cheby1(N,Rp,Wn,'s');     % ��ģ���ͨ�˲�����ϵ��
[B,A]=bilinear(bs,as,Fs);        % ��Fs��ģ���ͨ�˲�����ϵ��ת���������˲���
%��ʾ�˲���ϵ��
fprintf('B=%5.6f   %5.6f   %5.6f   %5.6f   %5.6f\n',B);
fprintf('A=%5.6f   %5.6f   %5.6f   %5.6f   %5.6f\n',A);
[H1,f1]=freqz(B,A,1000,Fs);      % ���������˲�������Ӧ����

Wp=2/T*tan(wp/2);                % ��ͨ���������Fs=1����Ԥ��
Ws=2/T*tan(ws/2);
[N,Wn]=cheb1ord(Wp,Ws,Rp,Rs,'s');% ��ԭ��ģ���ͨ�˲����Ľ����ʹ��� 
[bs,as]=cheby1(N,Rp,Wn,'s');     % ��ģ���ͨ�˲�����ϵ��
[B,A]=bilinear(bs,as,1);         % ��Fs=1��ģ���ͨ�˲�����ϵ��ת���������˲���
%��ʾ�˲���ϵ��
fprintf('B=%5.6f   %5.6f   %5.6f   %5.6f   %5.6f\n',B);
fprintf('A=%5.6f   %5.6f   %5.6f   %5.6f   %5.6f\n',A);
[H2,f2]=freqz(B,A,1000,Fs);      % ���������˲�������Ӧ����,�ָ�ԭ����Ƶ��
% ��ͼ
subplot 211; plot(f1,20*log10(abs(H1)),'k','linewidth',2)
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB')
title('�б�ѩ��I�͵�ͨ�˲�����Ƶ��Ӧ(bilinear��Fs=1000)')
axis([0 300 -50 5]); %grid; 
line([100 100],[-50 5],'color','k','linestyle',':');
line([200 200],[-50 5],'color','k','linestyle',':');
line([0 300],[-40 -40],'color','k','linestyle','--');
line([0 300],[-2 -2],'color','k','linestyle','--');
[H2,f2]=freqz(B,A,1000,Fs);
subplot 212; plot(f2,20*log10(abs(H2)),'k','linewidth',2)
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB')
title('�б�ѩ��I�͵�ͨ�˲�����Ƶ��Ӧ(bilinear��Fs=1)')
axis([0 300 -50 5]); %grid; 
line([100 100],[-50 5],'color','k','linestyle',':');
line([200 200],[-50 5],'color','k','linestyle',':');
line([0 300],[-40 -40],'color','k','linestyle','--');
line([0 300],[-2 -2],'color','k','linestyle','--');
set(gcf,'color','w') 

