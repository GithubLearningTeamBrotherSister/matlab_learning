%
% pr3_16_3 
clc; clear all; close all;

[x,Fs]=audioread('m_noise.wav');% �������ݺͲ���Ƶ��
Pref=2e-5;                    % �ο���ѹ
% 1/3��Ƶ���˲�������Ƶ��
ff = [ 20, 25 31.5 40, 50 63 80, 100 125 160,...                       
    200 250 315, 400 500 630, 800 1000 1250, 1600 2000 2500, ...   
	3150 4000 5000, 6300 8000 10000, 12500 16000]; 
nc=length(ff);                % 1/3�˲�������
P = zeros(1,nc);              % ��ʼ��
m = length(x);                % x�ĳ���
oc6=2^(1/6);                  % ��Ƶ�̵ı���

for i=1:nc
    fl=ff(i)/oc6;             % ���1/3��Ƶ�̵ͽ�ֹƵ��
    fu=ff(i)*oc6;             % ���1/3��Ƶ�̸߽�ֹƵ��
% ����fdesign+designign���������˲���ϵ������Hd    
    d=fdesign.bandpass('N,F3DB1,F3DB2',8,fl,fu,Fs);
    Hd=design(d);
    y = filter(Hd,x);         % �˲�
    P(i) = sum(y.^2)/m;       % ��������źŵľ���ֵ 
end
% �����Ƶ������ѹ��������ѹ��
Psum=0;
for i=1 : nc
    Pow(i) = 10*log10(P(i)/Pref^2);% �����Ƶ������ѹ��
    Psum=Psum+P(i);           % �������
end
Lps=10*log10(Psum/Pref^2);    % ��������ѹ��
fprintf('LPS=%5.6fdB\n',Lps);

bar(Pow);
set(gca,'XTick',[2:3:30]); grid		 
set(gca,'XTickLabels',ff(2:3:length(ff)));  
xlabel('����Ƶ��/Hz'); ylabel('��ѹ��/dB');
title('����֮һ��Ƶ���˲��������ѹ��')
set(gcf,'color','w'); 





