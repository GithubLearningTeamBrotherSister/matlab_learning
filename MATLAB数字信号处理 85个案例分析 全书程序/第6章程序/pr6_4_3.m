%
% pr6_4_3 
clear all; clc; close all;

fs = 1024;                             % ����Ƶ��
N  = 40960;                            % ���ݳ�
n1=1:1:N;                              % ��1��ȡ��ֵ��Χ
t2=(n1-1)/fs;                          % ʱ��̶�
arc=pi/180;                            % 1����

Am=[0.15 10 0.11];                     % ��ֵ����
Fr=[48.08 49.72 51.36];                % Ƶ�ʲ���
Theta=[73 32 -13];                     % ��ʼ��λ����(��)
x=zeros(1,N);                          % ���ݳ�ʼ��
% �����ź�
for k=1 : 3
    x=x+Am(k)*cos(2*pi*Fr(k)*t2+Theta(k)*arc);  % �ź�
end
% ZFFT
D=128; fe=50;                          % ϸ������������Ƶ��
nfft=256;                              % nfft��
[y,freq,xx]=exzfft_ma(x,fe,fs,nfft,D); % ZFFT 

% У������
fs1=fs/D;                              % ��������Ĳ���Ƶ��
fi=freq(1);                            % Ƶ�ʿ̶ȵ�1���ֵ
Nw=256; Lw=32;                         % ����L��M
% ��ʱ��ƽ����λ��У��������
Z=phase1_afterexzfft(xx,fi,Nw,Lw,fs1,47.5,49); % ����1������
fprintf('%5.6f   %5.6f   %5.6f\n',Z(1),Z(2),Z(3)/arc)
Z=phase1_afterexzfft(xx,fi,Nw,Lw,fs1,49,50.5); % ����2������
fprintf('%5.6f   %5.6f   %5.6f\n',Z(1),Z(2),Z(3)/arc)
Z=phase1_afterexzfft(xx,fi,Nw,Lw,fs1,50.5,52); % ����3������
fprintf('%5.6f   %5.6f   %5.6f\n',Z(1),Z(2),Z(3)/arc)



