clc
clear all
<<<<<<< HEAD
close allsyms 
=======
close all

>>>>>>> origin/master
%% �½�һ���źŲ�����pcm_encode�����������pcm����
% �źŲ�ʱ�䳤��2�룬Ƶ��1Hz���źŷ�ֵ1000
t=[0:0.05:2];
f=1;
signal_x=1000*sin(2*pi*f*t);
signal_out=pcm_encode(signal_x);

%% ���������������зֱ����ԭʼ�ź�signal_x�ͱ������ź�signal_out
figure
subplot(2,1,1)
plot(signal_x)
subplot(2,1,2)
stairs(signal_out)
ylim([-0.5 1.5])

%% �����������봰�ڣ�������ʾ�����ض�λ�õ�ϸ��
figure
%�趨һ��ʱ�ӣ��������ο�
clock=[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1];
subplot(3,1,1)
stairs(clock)
legend('clock')
ylim([-0.5 1.5])
subplot(3,1,2)
stairs(signal_out(17:24))
signal_x(3)
legend('signal_x(3)=578')
ylim([-0.5 1.5])
subplot(3,1,3)
stairs(signal_out(25*8+1:26*8))
ylim([-0.5 1.5])
signal_x(26)
legend('signal_x(3)=1000')


