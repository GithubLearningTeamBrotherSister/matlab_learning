%
% pr3_15_2 
clear all; clc; close all;

d=fdesign.lowpass('Fp,Fst,Ap,Ast',0.25,0.4,0.25,40);  % �����˲����Ĳ�������
designmethods(d)                   % ���������������õ��˲���
hd=design(d,'ellip');              % �����Բ�˲���

[N,wn]=ellipord(0.25,0.4,0.25,40); % �Դ�ͳʹ�÷������˲����Ľ����ʹ���
[b,a]=ellip(N,0.25,40,wn);         % ������Բ�˲�����ϵ��
Hd=dfilt.df2(b,a);                 % �����ͳʹ�÷������˲���ϵ������
% ��ͼ
fvtool(hd,Hd)
legend('fdesign+design��','��ͳʹ�÷���');
set(gcf,'color','w')            
