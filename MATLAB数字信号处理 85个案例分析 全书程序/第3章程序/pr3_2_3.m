%
% pr3_2_3 
clear all; close all; clc;

wp=[0.2*pi 0.3*pi];              % ����ͨ��Ƶ��
ws=[0.1*pi 0.4*pi];              % �������Ƶ��
Rp=1; Rs=20;                     % ���ò���ϵ��

% ������˹�˲������
[N,Wn]=buttord(wp,ws,Rp,Rs,'s'); % �������˹�˲�������
fprintf('������˹�˲��� N=%4d\n',N) % ��ʾ�˲�������
[bn,an]=butter(N,Wn,'s');        % �������˹�˲���ϵ��
W1=Wn(1); W2=Wn(2);              % ����W1,W2
Wo=sqrt(W1*W2);
Bw=W2-W1;
[z,p,k]=buttap(N);               % ��Ƶ�ͨԭ�������˲���
[Bap,Aap]=zp2tf(z,p,k);          % ��㼫��������ʽת��Ϊ���ݺ�����ʽ
[bb,ab]=lp2bp(Bap,Aap,Wo,Bw);    % ��ͨ�˲���Ƶ��ת��
W=0:0.01:2;                      % ����ģ��Ƶ��
[Hn,wn]=freqs(bn,an,W);          % �������˹�˲���Ƶ����Ӧ
[Hb,wb]=freqs(bb,ab,W);          % �������˹�˲���Ƶ����Ӧ
% ��ͼ
plot(wn/pi,20*log10(abs(Hn)),'r','linewidth',2)
hold on
plot(wb/pi,20*log10(abs(Hb)),'k')% ��ͼ
title('���ֱ�̷�����ư�����˹��ͨ�˲���');
xlabel('ԲƵ��{\omega}/{\pi}'); ylabel('��ֵ/dB')
set(gcf,'color','w'); 
axis([0 max(wb/pi) -30 2]); 
legend('��1�ֱ�̷���','��2�ֱ�̷���')
line([0 max(wb/pi)],[-20 -20],'color','k','linestyle','--');
line([0 max(wb/pi)],[-1 -1],'color','k','linestyle','--');
line([0.2 0.2],[-30 2],'color','k','linestyle','--');
line([0.3 0.3],[-30 2],'color','k','linestyle','--');
