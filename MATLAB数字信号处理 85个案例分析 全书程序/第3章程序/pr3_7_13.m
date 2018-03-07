%
% pr3_7_13 from bp1341
clear all; close all; clc;

fc=400;fb=600;                   % ����ͨ�������Ƶ��
Rp=3;Rs=20;                      % ����ͨ�����ƺ����˥��
Fs=4000; Fs2=Fs/2;               % ����Ƶ�ʺ��ο�˹��Ƶ��
Wp=fc/Fs2; Ws=fb/Fs2;            % ͨ���������һ��Ƶ��
[N,Wn]=buttord(Wp,Ws,Rp,Rs);     % ��ư�����˹ԭ���˲���
[bn,an] = butter(N,Wn);          % ����˲���ϵ��bn,an
[H1,w]=freqz(bn,an);             % ������Ӧ����
Hgd=grpdelay(bn,an);             % ����Ⱥ�ӳ�����

F = 0:0.001:Wp;                  % ͨ������
g = grpdelay(bn,an,F,2);         % ���ͨ��Ⱥ�ӳ�
Gd = max(g)-g;                   % ����һ������Ⱥ�ӳ�ֵ
% ���һ��IIRȫͨ�˲���
[num,den,tau]=iirgrpdelay(4, F, [0 0.2], Gd);  

B=conv(num,bn);                  % ���˲���������ϵ��
A=conv(den,an);
[Ho,wo]=freqz(B,A);              % ���㼶���˲�����Ӧ����
[Hogd,wgd]=grpdelay(B,A);        % ���㼶���˲���Ⱥ�ӳ�����
% ��ͼ
subplot 221; plot(w*Fs/2/pi,20*log10(abs(H1)),'k'); 
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB');
title('(a)������˹�˲�����Ƶ��Ӧ'); axis([0 2000 -100 10]);

subplot 222; plot(w*Fs/2/pi,Hgd,'k'); xlim([0 2000]);
xlabel('Ƶ��/Hz��'); ylabel('�ӳ���/������');
title('(b)������˹�˲���Ⱥ�ӳ�')
subplot 223; plot(wo/pi*Fs2,20*log10(abs(Ho)),'k');
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB');
title('(c)�����˲�����Ƶ��Ӧ'); axis([0 2000 -100 10]);
subplot 224; plot(wgd/pi*Fs2,Hogd,'k');
xlabel('Ƶ��/Hz'); ylabel('�ӳ���/������');
title('(d)�����˲���Ⱥ�ӳ�')
set(gcf,'color','w'); 