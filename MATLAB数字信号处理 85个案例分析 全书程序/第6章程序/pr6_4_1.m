%
%  pr6_4_1 
clear all; clc; close all;
fs = 1024;                   % ����Ƶ��
N  = 1024;                   % ���ݳ�

arc=pi/180;                  % 1����
n1=1:N;                      % ��1��ȡ��ֵ��Χ
n2=1:N;                      % ���ݳ�
t2=(n2-1)/fs;                % ʱ��̶�

Am=[3.3 5.4 8.7 2.6];        % ��ֵ����
Fr=[42.7 196.3 250.4 354.8]; % Ƶ�ʲ���(Hz)
Theta=[30 50 80 140];        % ��ʼ��λ����(��)
x=zeros(1,N);                % ���ݳ�ʼ��
% �����ź�
for k=1 : 4
    x=x+Am(k)*cos(2*pi*Fr(k)*t2+Theta(k)*arc);  % �ź�
end
L=128; M=N/2;               % L��M
Z=Phase_Gmtda(x,N,L,M,fs,40,45,2); % ����1������
fprintf('%5.6f  %5.6f  %5.6f\n',Z(1),Z(2),Z(3)/arc);

Z=Phase_Gmtda(x,N,L,M,fs,190,200,2); % ����2������
fprintf('%5.6f  %5.6f  %5.6f\n',Z(1),Z(2),Z(3)/arc);

Z=Phase_Gmtda(x,N,L,M,fs,245,255,2); % ����3������
fprintf('%5.6f  %5.6f  %5.6f\n',Z(1),Z(2),Z(3)/arc);

Z=Phase_Gmtda(x,N,L,M,fs,350,360,2); % ����4������
fprintf('%5.6f  %5.6f  %5.6f\n',Z(1),Z(2),Z(3)/arc);






