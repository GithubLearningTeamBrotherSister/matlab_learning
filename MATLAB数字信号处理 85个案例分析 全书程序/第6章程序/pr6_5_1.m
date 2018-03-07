%
% pr6_5_1  
close all;clc;clear all;

fs = 2000;                             % ����Ƶ��
N  = 1024;                             % FFT��
arc=pi/180;                            % 1����
n=-N+1:2*N-1;                          % ��������������               
t2=n/fs;                               % ʱ��̶�

Am=[1 0.8 0.6 0.4 0.2];                % ��ֵ���� 
Fr=[49.1 149.2 249.3 349.4 449.5];     % Ƶ�ʲ���(Hz)
Theta=[50 100 150 200 250];            % ��ʼ��λ����(��)

x=zeros(1,3*N-1);                      % ���ݳ�ʼ��
% �����ź�
for k=1 : 5
    x=x+Am(k)*cos(2*pi*Fr(k)*t2+Theta(k)*arc);  % �����ź�
end
% ÿ������Ѱ��Ƶ�ʵ�����
NX=[45, 55; 145, 155; 245, 255; 345, 355; 445, 455];
L=N; M=N;

y=x(N:end);                            % Ϊ��ͳFFT��λ�У��׼������
EZ=zeros(3,5,3);                       % ��ƫ��ֵ�����ʼ��
for k=1 : 5                            % ����5�����ҷ����Ĳ�������ʾ
    fprintf('%1dͨ������ֵ   ��ֵ=%5.2f    Ƶ��=%5.2f   ��ʼ��λ=%5.2f\n',...
        k,Am(k),Fr(k),Theta(k));
    Z=apFFTcorrm(x,N,L,fs,NX(k,1),NX(k,2));              % ����1У��
    EZ(1,k,:)=[Am(k)-Z(1) Fr(k)-Z(2) Theta(k)-Z(3)/arc]; % ����ƫ��ֵ
    fprintf('����1  %5.6f  %5.6f   %5.6f\n',Z(1),Z(2),Z(3)/arc);
    Z=FFT_apFFTcorrm(x,N,fs,NX(k,1),NX(k,2));            % ����2У��
    fprintf('����2  %5.6f  %5.6f   %5.6f\n',Z(1),Z(2),Z(3)/arc);
    EZ(2,k,:)=[Am(k)-Z(1) Fr(k)-Z(2) Theta(k)-Z(3)/arc]; % ����ƫ��ֵ
    Z=Phase_Gmtda(y,N,L,M,fs,NX(k,1),NX(k,2),2);         % ����3У��
    if Z(3)<0, Z(3)=2*pi+Z(3); end                       % ʹ�����0~2*pi֮��
    fprintf('����3  %5.6f  %5.6f   %5.6f\n',Z(1),Z(2),Z(3)/arc);
    EZ(3,k,:)=[Am(k)-Z(1) Fr(k)-Z(2) Theta(k)-Z(3)/arc]; % ����ƫ��ֵ
    fprintf('\n');
       
end
% ��ʾ����5�����ҷ����Ĳ���������ֵ��ƫ��
for k=1 : 5
    fprintf('%1dͨ��\n',k);
    fprintf('����1   %5.6e  %5.6e   %5.6e\n',EZ(1,k,1),EZ(1,k,2),EZ(1,k,3));
    fprintf('����2   %5.6e  %5.6e   %5.6e\n',EZ(2,k,1),EZ(2,k,2),EZ(2,k,3));
    fprintf('����3   %5.6e  %5.6e   %5.6e\n',EZ(3,k,1),EZ(3,k,2),EZ(3,k,3));
    fprintf('\n');
end




