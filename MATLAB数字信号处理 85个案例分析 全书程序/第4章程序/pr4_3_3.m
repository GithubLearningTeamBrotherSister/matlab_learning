%
% pr4_3_3
clear all; clc; close all;

n=-5000:20:5000;            % ��������
N=length(n);                % �ź�������
nt=0:N-1;                   % �����������к�
x=120+96*exp(-(n/1500).^2).*cos(2*pi*n/600); % �����ź�
[up,down] = envelope(n,x,'splin');
% ��ͼ
plot(nt,x,'k',nt,up,'r',nt,down,'g');
xlabel('����'); ylabel('��ֵ'); grid;
title('����envelope������ȡ���°�������ͼ')
set(gcf,'color','w');


