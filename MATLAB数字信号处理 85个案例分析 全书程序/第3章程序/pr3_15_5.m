%
% pr3_15_5  
clear all; clc; close all;

fs=250;                      % ����Ƶ��
ast=15; ap=3;                % ���˥����ͨ������
fst1=1; fst2=12;             % ���Ƶ��
fp1=1.5; fp2=10;             % ͨ��Ƶ��
% ��1���ּ����������d
d=fdesign.bandpass('fst1,fp1,fp2,fst2,ast1,ap,ast2',fst1,fp1,fp2,fst2,ast,ap,ast,fs);
designmethods(d)             % ���������������õ��˲���
hd = design(d,'butter');     % ��ư�����˹�˲���
fvtool(hd);                  % ��ͼ
set(gcf,'color','w')

% ��2����,��ֱ�����˲���ϵ��,���������ĸ�ļ���
[B,A]=tf(hd);
poles=roots(A);
M=length(poles);
for k=1 : M
    fprintf('%4d     %5.4f     %5.4fi     %5.4f\n',k,real(poles(k)),imag(poles(k)),abs(poles(k)));
end


