%
% pr3_15_1 
clear all; clc; close all;

d = fdesign.lowpass('N,F3dB,ap',6,0.4,0.5);  % �����˲����Ĳ�������
designmethods (d)         % ���������������õ��˲���
hd = design(d,'cheby1');  % �������ѩ��I���˲���
fvtool(hd)                % ��ʾ�˲�����Ӧ����


