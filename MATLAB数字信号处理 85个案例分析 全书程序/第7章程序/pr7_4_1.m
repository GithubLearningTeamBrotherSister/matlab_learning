% 
% pr7_4_1  
clear all; clc; close all;

f0=49.13;                    % ����Ƶ��
fs=3200;                     % ����Ƶ��
N=2048;                      % ���ݳ���
n=0:N-1;                     % ��������
rad=pi/180;                  % �ǶȺͻ��ȵ�ת������
xb=[240,0.1,12,0.1,2.7,0.05,2.1,0,0.3,0,0.6]; % г����ֵ
Q=[0,10,20,30,40,50,60,0,80,0,100]*rad;       % г����ʼ��λ

t=n/fs;
M=11;
x=zeros(1,N);                % ��ʼ��
for k=1 : M                  % ����г���ź�
    x=x+xb(k)*cos(2*pi*f0*k*t+Q(k));
end
% ����signal_hpronys�������г������
Z=signal_hpronys(x,30,fs,0.0001);
K=size(Z,1);                 % ��ȡг���ĸ���
% ��ʾг������
for k=1 : K
   fprintf('%4d     alpha=%5.6f   F=%5.6f  A=%5.6f  theta=%5.6f\n',...
       k,Z(k,1),Z(k,2),Z(k,3),Z(k,4)/rad);
end


