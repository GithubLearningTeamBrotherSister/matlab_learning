%
% pr3_2_1
clear all; close all; clc;

wp=[0.2*pi 0.3*pi];              % ����ͨ��Ƶ��
ws=[0.1*pi 0.4*pi];              % �������Ƶ��
Rp=1; Rs=20;                     % ���ò���ϵ��
% ������˹�˲������
[N,Wn]=buttord(wp,ws,Rp,Rs,'s'); % �������˹�˲�������
fprintf('������˹�˲��� N=%4d\n',N) % ��ʾ�˲�������
[bb,ab]=butter(N,Wn,'s');        % �������˹�˲���ϵ��
W=0:0.01:2;                      % ����ģ��Ƶ��
[Hb,wb]=freqs(bb,ab,W);          % �������˹�˲���Ƶ����Ӧ
plot(wb/pi,20*log10(abs(Hb)),'b')% ��ͼ
hold on

% �б�ѩ��I���˲������
[N,Wn]=cheb1ord(wp,ws,Rp,Rs,'s');  % ���б�ѩ��I���˲�������
fprintf('�б�ѩ��I���˲��� N=%4d\n',N) % ��ʾ�˲�������
[bc1,ac1]=cheby1(N,Rp,Wn,'s');     % ���б�ѩ��I���˲���ϵ��
[Hc1,wc1]=freqs(bc1,ac1,W);        % ���б�ѩ��I���˲���Ƶ����Ӧ
plot(wc1/pi,20*log10(abs(Hc1)),'k')% ��ͼ

% �б�ѩ��II���˲������ 
[N,Wn]=cheb2ord(wp,ws,Rp,Rs,'s');  % ���б�ѩ��II���˲�������
fprintf('�б�ѩ��II���˲��� N=%4d\n',N) % ��ʾ�˲�������
[bc2,ac2]=cheby2(N,Rs,Wn,'s');    % ���б�ѩ��II���˲���ϵ��
[Hc2,wc2]=freqs(bc2,ac2,W);       % ���б�ѩ��II���˲���Ƶ����Ӧ
plot(wc2/pi,20*log10(abs(Hc2)),'r')% ��ͼ

% ��Բ���˲������
[N,Wn]=ellipord(wp,ws,Rp,Rs,'s');  % ����Բ���˲�������
fprintf('��Բ���˲��� N=%4d\n',N) % ��ʾ�˲�������
[be,ae]=ellip(N,Rp,Rs,Wn,'s');     % ����Բ���˲���ϵ��
[He,we]=freqs(be,ae,W);            % ����Բ���˲���Ƶ����Ӧ
% ��ͼ
plot(we/pi,20*log10(abs(He)),'g')
axis([0 max(we/pi) -30 2]); %grid;
legend('������˹�˲���','�б�ѩ��I���˲���','�б�ѩ��II���˲���','��Բ���˲���')
xlabel('��Ƶ��{\omega}/{\pi}'); ylabel('��ֵ/dB')
set(gcf,'color','w'); 

line([0 max(we/pi)],[-20 -20],'color','k','linestyle','--');
line([0 max(we/pi)],[-1 -1],'color','k','linestyle','--');
line([0.2 0.2],[-30 2],'color','k','linestyle','--');
line([0.3 0.3],[-30 2],'color','k','linestyle','--');

