%
% pr3_2_2 
clear all; close all; clc;

wp=0.2*pi;                       % ����ͨ��Ƶ��
ws=0.3*pi;                       % �������Ƶ��
Rp=3; Rs=20;                     % ���ò���ϵ��

[N,Wn]=buttord(wp,ws,Rp,Rs,'s'); % �������˹�˲�������
[bn,an]=butter(N,Wn,'s');        % �������˹�˲���ϵ��
fprintf('������˹�˲��� N=%4d\n',N) % ��ʾ�˲�������
% ��ʾϵ��
fprintf('%5.6e   %5.6e   %5.6e   %5.6e   %5.6e   %5.6e   %5.6e\n',bn);
fprintf('%5.6e   %5.6e   %5.6e   %5.6e   %5.6e   %5.6e   %5.6e\n',an);

[z,p,k]=buttap(N);               % ��Ƶ�ͨԭ�������˲���
[Bap,Aap]=zp2tf(z,p,k);          % ��㼫��������ʽת��Ϊ���ݺ�����ʽ
[bb,ab]=lp2lp(Bap,Aap,Wn);       % ��ͨ�˲���Ƶ��ת��
% ��ʾϵ��
fprintf('%5.6e\n',bb);
fprintf('%5.6e   %5.6e   %5.6e   %5.6e   %5.6e   %5.6e   %5.6e\n',ab);
