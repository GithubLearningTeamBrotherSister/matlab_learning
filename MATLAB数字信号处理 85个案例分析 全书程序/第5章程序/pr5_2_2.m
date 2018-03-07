%
% pr5_2_2 
clear all; clc; close all;

fs=2048;                         % ����Ƶ��
nfft=1024;                       % FFT�任����
fk=[50 150 496 498 500 502 505]; % Ƶ�ʾ���
A=[220 35 1 1 1 1 1];            % ��ֵ����
D=100;                           % ϸ������
a=0.3;                           % ����ϵ��
L=nfft*D+round(8*D/a);           % ���ݳ���
t=(0:L-1)/fs;                    % ʱ��̶�
x=zeros(1,L);                    % ��ʼ��
for k=1 : 7                      % �����ź�
    x=x+A(k)*cos(2*pi*fk(k)*t);
end
fe=500;                          % ϸ����������Ƶ��
[xz,f]=zoomffta(x,fs,nfft,fe,D,a);  % �������˲���������ϸ������
% ��ͼ
subplot 211; plot(t,x,'k'); xlim([0 0.5]);
xlabel('ʱ��/s'); ylabel('��ֵ')
title('�ź�ʱ����');
subplot 212; plot(f,abs(xz),'k','linewidth',1.5); 
set(gca, 'XTickMode', 'manual', 'XTick', [495,496,498,500,502,504,505,506]);
grid; ylim([0 1.2]);
xlabel('Ƶ��/Hz'); ylabel('��ֵ')
title('�ܼ���г���ķ���');
set(gcf,'color','w');

