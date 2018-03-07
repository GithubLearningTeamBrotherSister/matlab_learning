%
% pr6_4_2 
clear all; clc; close all;
fs = 1024;                  % ����Ƶ��
N  = 4096;                  % ���ݳ�

arc=pi/180;                 % 1����
ra=[131 137];               % ���ҷ�Χ
n1=1:1:N;                   % ��1��ȡ��ֵ��Χ
n2=1:2*N;                   % ���ݳ�
t2=(n2-1)/fs;               % ʱ��̶�

Am=[0.15 10 0.11];           % ��ֵ����
Fr=[48.08 49.72 51.36];      % Ƶ�ʲ���
Theta=[73 32 -13];           % ��ʼ��λ����(��)
x=zeros(1,2*N);              % ���ݳ�ʼ��

% �����ź�
for k=1 : 3
    x=x+Am(k)*cos(2*pi*Fr(k)*t2+Theta(k)*arc);  % �ź�
end
L=1024; M=N;               % ����L��M
wind1=blackmanharris(N);   % Blackmanharris������
wind2=blackmanharris(M);

Z=phase_AnyWind(x,N,L,M,fs,47,49,wind1,wind2); % ����1������
fprintf('%5.6f  %5.6f  %5.6f\n',Z(1),Z(2),Z(3)/arc);

Z=phase_AnyWind(x,N,L,M,fs,49,51,wind1,wind2); % ����2������
fprintf('%5.6f  %5.6f  %5.6f\n',Z(1),Z(2),Z(3)/arc);

Z=phase_AnyWind(x,N,L,M,fs,51,53,wind1,wind2); % ����3������
fprintf('%5.6f  %5.6f  %5.6f\n',Z(1),Z(2),Z(3)/arc);





