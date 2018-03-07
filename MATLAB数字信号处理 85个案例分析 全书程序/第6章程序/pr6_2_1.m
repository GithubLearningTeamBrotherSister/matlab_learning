%
% pr6_2_1 
clear all; clc; close all;

xx=load('uy_25a.txt');                 % ���������ļ�
t=xx(:,1); x=xx(:,2);                  % �õ�ʱ�����к��ź�����
dt=t(2)-t(1); fs=1/dt;                 % �������Ƶ��
N=length(x);                           % ���ݳ���
y=x;                                   % ����ԭʼ�ź���y��
n=1:N; n2=1:N/2+1;                     % ����n��n2
df=fs/N;                               % ����Ƶ�ʷֱ���
freq=(n2-1)*df;                        % ����Ƶ�ʿ̶�
Y=fft(y);                              % ����ԭʼ�źŵ�Ƶ��

rad=pi/180;                            % 1����ֵ
DX=[5 15];                             % Ѱ�һ���������
t=(0:N-1)/fs;                          % ����ʱ��̶�
for k=1 : 99                           % �������2~99��г���Ĳ���
    if k==1;                           % ��kΪ1,�����������
        NX=DX;                         % ����Ѱ�һ���������
        Z=specor_m1(x,fs,N,NX,2);      % ��ֵУ������������Ĳ���
        u=Z(2)*cos(2*pi*Z(1)*t+Z(3));  % ����������ź�
        x=x'-u;                        % ��ԭʼ�ź��м�ȥ�����ĳɷ�
        f0=Z(1);                       % ������Ƶ��
    else                               % ��2~99��г���Ĳ���
        NX=[k*f0-DX(1) k*f0+DX(1)];    % ����Ѱ��k��г����Ƶ������
        Z=specor_m1(x,fs,N,NX,2);      % ��ֵУ�������k��г���Ĳ���
        u=Z(2)*cos(2*pi*Z(1)*t+Z(3));  % �����k��г���ź�
        x=x-u;                         % ��ԭʼ�ź��м�ȥk��г���ĳɷ�
    end
end
X=fft(x);                              % ���������źź��Ƶ��
% ��ͼ
figure(1);
subplot 211; plot(t,y,'k')
axis([0 5 -2e-3 2e-3]); title('����ǰ�źŵ�ʱ����');
xlabel('ʱ��/s'); ylabel('��ֵ');
subplot 212; plot(freq,10*log10(abs(Y(n2))),'k');  
axis([0 1000 -40 10]); title('����ǰ�źŵ�Ƶ��ͼ');
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB'); grid;
set(gcf,'color','w'); 

figure(2);
subplot 211; plot(t,x,'k')
axis([0 5 -1.2e-3 1e-3]); title('������źŵ�ʱ����');
xlabel('ʱ��/s'); ylabel('��ֵ');
subplot 212; plot(freq,10*log10(abs(X(n2))),'k'); 
axis([0 1000 -40 10]); title('������źŵ�Ƶ��ͼ');
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB'); grid;
set(gcf,'color','w'); 

    

    
    


