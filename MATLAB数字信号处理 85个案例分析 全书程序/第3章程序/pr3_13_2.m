% 
% pr3_13_2 
clear all; clc; close all

Fs=1000;                                   % ����Ƶ��
Fs2=Fs/2;                                  % �ο�˹��Ƶ��
fs1=100; fp1=175;                          % ͨ�������Ƶ��
fp2=275; fs2=350;
ws1 = fs1*pi/Fs2; wp1 = fp1*pi/Fs2;        % ͨ���������һ����Ƶ��
wp2 = fp2*pi/Fs2; ws2 = fs2*pi/Fs2;
tr_width = min((wp1-ws1),(ws2-wp2));       % ���ɴ����صļ���
M = ceil(6.2*pi/tr_width);                 % ������������������˲�������N
M=M+mod(M+1,2);                            % ��֤�˲���ϵ����N+1Ϊ����
% ��ideal_lp����
wc1 = (ws1+wp1)/2; wc2 = (wp2+ws2)/2;      % ���ֹƵ�ʵĹ�һ����Ƶ��
hd = ideal_lp(wc2,M) - ideal_lp(wc1,M);    % ��ideal_lp�������������˲���������Ӧ
w_ha = (hanning(M))';                      % ����������
h = hd .* w_ha;                            % FIR�˲���������Ӧ
[db,mag,pha,grd,w] = freqz_m(h,[1]);       % ���Ƶ����Ӧ
delta_w = 2*pi/1000;                       % Ƶ���Ƶ�ʼ��
Rp = -min(db(wp1/delta_w+1:1:wp2/delta_w));% ͨ��ʵ�ʲ���ֵ
As = -round(max(db(ws2/delta_w+1:1:501))); % ���˥��ֵ
% ��fir1����
fc1 = wc1/pi; fc2=wc2/pi;                  % ���ֹƵ�ʹ�һ��ֵ
h1 = fir1(M-1,[fc1 fc2],hanning(M)');      % ��fir1�������������˲���������Ӧ
[db1,mag,pha,grd,w1] = freqz_m(h1,[1]);    % ���Ƶ����Ӧ
% ��ͼ
subplot 211;plot(w*Fs2/pi,db,'r','linewidth',2); hold on
plot(w1*Fs2/pi,db1,'k');
title('��ͨ�˲�����ֵ��Ӧ');grid;
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB')
legend('ideal_lp����','fir1����')
axis([0 Fs2 -60 10]); 
set(gca,'XTickMode','manual','XTick',[0,100,175,275,350,500])
set(gca,'YTickMode','manual','YTick',[-30,0])

n=1:M;
subplot 212; plot(n,h,'r','linewidth',2); hold on; 
plot(n,h1,'k')
title('��ͨ�˲���������Ӧ')
legend('ideal_lp����','fir1����')
axis([0 M-1 -0.4 0.5]); xlabel('����'); ylabel('��ֵ')
set(gcf,'color','w');
