%
% pr3_15_4  
clear all; clc; close all;

d = fdesign.lowpass('Fp,Fst,Ap,Ast',0.25,0.4,0.25,40);  % �����˲����Ĳ�������
designmethods (d)         % ���������������õ��˲���
hd = design(d,'alliir');  % ���IIR�˲���
fvtool(hd)                % ��ͼ
legend('������˹�˲���','����ѩ��I���˲���','����ѩ��II���˲���','��Բ�˲���')
set(gcf,'color','w')


