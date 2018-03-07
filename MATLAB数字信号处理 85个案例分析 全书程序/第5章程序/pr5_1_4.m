%
% pr5_1_4 
clear all; clc; close all;

load cjbdata.mat                 % ��������
N=length(y);                     % ���ݳ���
t=(0:N-1)*1000/fs;               % ʱ��̶�
M=256;                           % FFT�任����
width=fix((N+1)/4);              % ��������
h=hanning(width);                % ���ô�����
[S,tt,f]=tfrstft(y,1:N,M,h);     % STFT�任
[x,t_s]=tfristft(S,tt,h);        % ISTFT�任
Segma=var(x-y);
fprintf('Segma=%5.4e\n',Segma)
% ��ͼ
figure(1)
subplot 211; plot(t,y,'k'); grid;
ylabel('���ٶ�/g'); xlabel('ʱ��/ms');
title('ԭʼ�źŲ���'); xlim([0 max(t)]);
subplot 212; imagesc(t,f(1:128)*fs/1000,abs(S(1:128,:)));
title('�ź�STFT��ͼ'); xlabel('ʱ��/ms'); ylabel('Ƶ��/kHz');
axis([0 max(t) 0 15]); axis xy;
set(gcf,'color','w');
figure(2)
plot(tt,y,'r','linewidth',3); hold on
plot(t_s,x,'k'); grid;
legend('ԭʼ�ź�','�ع��ź�')
ylabel('���ٶ�/g'); xlabel('����');
title('ԭʼ�źź��ع��źűȽ�'); xlim([0 max(tt)]);
set(gcf,'color','w');

