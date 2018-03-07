%
% pr4_2_3 
clear all; clc; close all;

[xx,fs]=wavread('sch32.wav');     % �������ݺͲ���Ƶ��
x=xx(:,1);                        % ˫�������ݷֱ��趨Ϊx��y
y=xx(:,2);
N = length(x);                    % �źų���
n=0:N-1;                          % ���к�
[R,lags]=xcorr(y,x);              % ����y��x�Ļ���غ���
[Rmax,K]=max(R);                  % ��R�������ֵ����Ӧλ��
lagk=lags(K);
fprintf('lagk=%4d   Rmax=%5.4f\n',lagk,Rmax);  % ��ʾ�ڲ�ǰ����ӳ����ͷ�ֵ
[Locs,Val]=findpeakm(R,'q',35);   % ��findpeakm����Ѱ����غ����еķ�ֵ
Locs=Locs-N;                      % ����Logs
fprintf('Mmax=%5.4f   Rmax=%5.4f\n',Locs(9),Val(9)); % ��ʾ����ӳ����ͷ�ֵ
% ��ͼ
subplot 211; plot(n,x,'k');
xlabel('����'); ylabel('��ֵ'); 
title('�ź�x����ͼ'); xlim([0 N]);
subplot 212; plot(n,y,'k');
xlabel('����'); ylabel('��ֵ'); 
title('�ź�y����ͼ'); xlim([0 N]);
set(gcf,'color','w');
figure
subplot 211; plot(lags,R,'k'); grid; hold on;
plot(Locs,Val,'ro');
axis([min(lags) max(lags) -25 45])
xlabel('�ӳ���/����'); ylabel('��غ�����ֵ'); 
title('��غ�������ͼ');
subplot 212; plot(lags,R,'k'); grid; hold on
plot(Locs,Val,'ro');
axis([-20 20 -25 45]);
xlabel('�ӳ���/����'); ylabel('��غ�����ֵ'); 
title('��غ�������ͼ(���ֵ)');
set(gcf,'color','w');



