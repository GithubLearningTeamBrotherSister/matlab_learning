%
% pr4_2_1 
clear all; clc; close all;

y=load('ffpulse.txt');       % ������������
x=detrend(y);                % ����������
fs=200;                      % ����Ƶ��
N=length(x);                 % ���ݳ���
time=(0:N-1)/fs;             % ʱ��̶�
% ��һ����,��findpeaks�������ֵλ��
[Val,Locs]=findpeaks(x,'MINPEAKHEIGHT',200,'MINPEAKDISTANCE',100);
T1=time(Locs);               % ȡ��������ֵʱ��
M1=length(T1);
T11=T1(2:M1);
T12=T1(1:M1-1);
Mdt1=mean(T11-T12);          % �ӷ�ֵ�õ�ƽ������ֵ
fprintf('��ֵ��õ�ƽ������ֵ=%5.4f\n',Mdt1);
% ��ͼ
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1), pos(2)-100,pos(3),(pos(4)-140)]);
plot(time,x,'k'); hold on; grid;
plot(time(Locs),Val,'ro','linewidth',3);
xlabel('ʱ��/s'); ylabel('��ֵ'); title('�����źŲ���ͼ')
set(gcf,'color','w');
pause
% �ڶ�����,��findpeakm�������ֵλ��
[K,V]=findpeakm(x,'v',100);
T2=time(K);                  % ȡ��������ֵʱ��
M2=length(T2);
T21=T2(2:M1);
T22=T2(1:M1-1);
Mdt2=mean(T21-T22);          % �ӹ�ֵ�õ�ƽ������ֵ
fprintf('��ֵ��õ�ƽ������ֵ=%5.4f\n',Mdt2);
% ��ͼ
plot(time(K),V,'gO','linewidth',3);
set(gcf,'color','w');

