%
% pr3_7_3 
clear all; clc; close all;

load jandatas.mat              % ��������
N1=length(z);                  % ԭʼ���ݳ�
Fsm=1;                         % ԭʼ����Ƶ��1����1���� 
y=resample(z,Fsm,60);          % ������60��
N=length(y);                   % ��������ĳ���
hour=0:N-1;

Fsh=1;                         % �����������Ƶ��1Сʱ1���� 
fp=[0.05 0.1];                 % ͨ��Ƶ��
fs=[0.025 0.15];               % ���Ƶ��
Ap=1; As=50;                   % ͨ�����ƺ����˥��
Wp=fp*2/Fsh; Ws=fs*2/Fsh;      % ��һ��ͨ�������Ƶ��
[M,Wn]=cheb2ord(Wp,Ws,Ap,As);  % ���˲���ԭ�ͽ����ʹ���
[bn,an]=cheby2(M,As,Wn);       % �������˲���ϵ��
[H,f]=freqz(bn,an,1000,1);     % �������˲�����Ƶ����

x=filter(bn,an,y);             % �Խ�����������ݽ����˲�
xx=resample(x,60,1);           % ���˲�������ָ�ԭ����Ƶ��
xx=xx(1:N1);                   % ��ȡ������������ͬ���Ⱥ͵�λ
% ��ͼ
figure(1)
plot(f,20*log10(abs(H)),'k');
axis([0 0.2 -70 10]);  grid;
title('��Բ���˲�����Ƶ��Ӧ����');
xlabel('ʱ��/Сʱ'); ylabel('��ֵ/dB');
set(gcf,'color','w');
figure(2)
subplot 211; plot(hour,y,'k');
xlim([0 max(hour)]);
title('�������������'); xlabel('ʱ��/Сʱ'); 
subplot 212; plot(minute/10000,xx,'k');
title('�˲�������Ϊ10-20Сʱ������');xlabel('ʱ��/�����'); 
set(gcf,'color','w');

