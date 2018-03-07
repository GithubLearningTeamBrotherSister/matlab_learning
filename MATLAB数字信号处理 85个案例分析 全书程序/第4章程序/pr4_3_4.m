%
% pr4_3_4 from p431mo 
clear all; clc; close all;
y=load('su1.txt');                            % ��������
fs=16000; nfft=1024;                          % ����Ƶ�ʺ�FFT�ĳ���
time=(0:nfft-1)/fs;                           % ʱ��̶�
nn=1:nfft/2; ff=(nn-1)*fs/nfft;               % ����Ƶ�ʿ̶�
Y=log(abs(fft(y)));                           % ȡ��ֵ�Ķ���
z=ifft(Y);                                    % ��ʽ(4-3-16)��ȡ����
mcep=29;                                      % �������ż�����������������Ӧ
zy=z(1:mcep+1);
zy=[zy' zeros(1,1024-2*mcep-1) zy(end:-1:2)']; % �������������Ӧ�ĵ�������
ZY=fft(zy);                                   % �������������Ӧ��Ƶ��
% ��ͼ
plot(ff,Y(nn),'k'); hold on;                  % �����źŵ�Ƶ��ͼ
plot(ff,real(ZY(nn)),'k','linewidth',2.5);    % ����������
grid; hold off; ylim([-4 5]);
title('�ź�Ƶ�׺����������Ƶ�ף�Ƶ�װ��磩')
ylabel('��ֵ'); xlabel('Ƶ��/Hz'); 
legend('�ź�Ƶ��','Ƶ�װ���')
set(gcf,'color','w');

