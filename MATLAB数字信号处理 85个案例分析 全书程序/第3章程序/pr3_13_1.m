%
% pr3_13_1 
clear all; clc; close all

Fs=100;                          % ����Ƶ��
Fs2=Fs/2;                        % �ο�˹��Ƶ��
fp=3; fs=5;                      % ͨ�������Ƶ��
Rp=3; As=50;                     % ͨ�����ƺ����˥��
wp = fp*pi/Fs2; ws = fs*pi/Fs2;  % ͨ���������һ����Ƶ��
deltaw= ws - wp;                 % ���ɴ����صļ���
N = ceil(6.6*pi/ deltaw);        % ������������������˲�������N(��ʽ(3-13-1))
N = N + mod(N,2);                % ��֤�˲���ϵ����N+1Ϊ����
wind = (hamming(N+1))';          % ����������
Wn=(3+5)/100;                    % �����ֹƵ��
b=fir1(N,Wn,wind);               % ��fir1�������FIR��1���˲���
[db,mag,phs,gdy,w]=freqz_m(b,1); % �����˲�����Ӧ
% ��ͼ
subplot 211; plot(w*Fs/(2*pi),db,'k','linewidth',2);
title('(a)��ͨ�˲����ķ�ֵ��Ӧ');
grid; axis([0 20 -70 10]); 
xlabel('Ƶ��/Hz');  ylabel('��ֵ/dB')
set(gca,'XTickMode','manual','XTick',[0,3,5,20])
set(gca,'YTickMode','manual','YTick',[-50,0])
subplot 212; stem(1:N+1,b,'k');
xlabel('Ƶ��/Hz');  ylabel('��ֵ/dB')
title('(b)��ͨ�˲�����������Ӧ');
xlabel('����');  ylabel('��ֵ')
axis([0 167 -0.05 0.1]); 
set(gca,'XTickMode','manual','XTick',[1,84,167])
set(gcf,'color','w');

