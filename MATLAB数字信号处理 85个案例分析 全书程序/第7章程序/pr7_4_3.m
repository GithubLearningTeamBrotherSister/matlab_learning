% 
% pr7_4_3  
clear all; clc; close all;
warning off

f=[50 455.4 701.5];          % Ƶ��
fs=3200;                     % ����Ƶ��
N=512;                       % ���ݳ���
n=0:N-1;                     % ��������
t=n/fs;
t1=(-512:511)/fs;
rad=pi/180;                  % �ǶȺͻ��ȵ�ת������
% ����3���������ź�
s1=1.01*cos(2*pi*f(1)*t+0.409);
s2=0.9*exp(-199.73*t).*cos(2*pi*f(2)*t+0.511);
s3=0.69*exp(-439.26*t).*cos(2*pi*f(3)*t+2.001);
s=s1+s2+s3;                  % 3������������һ��

Z=signal_hpronys(s,10,fs,0.0001);

K=size(Z,1);
y=zeros(1,N);
for k=1 : K                  % ��ʾ3�������Ĳ���
   fprintf('%4d     alpha=%5.6f   F=%5.6f  A=%5.6f  theta=%5.6f\n',...
       k,Z(k,1),Z(k,2),Z(k,3),Z(k,4));
% �Ѳ����ϳ��ź�
   y=y+Z(k,3)*exp(Z(k,1)*t).*cos(2*pi*Z(k,2)*t+Z(k,4));
end

snr=prony_snr(s,y);          % ������ϵ������
fprintf('SNR=%5.6f\n',snr);  % ��ʾ�����ֵ
