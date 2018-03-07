% 
% pr3_7_9 
clear all; clc; close all;

fs=1600;                             % ����Ƶ��
f0=50;                               % ����Ƶ��
N=400;                               % ���ݳ���
t=(0:N-1)/fs;                        % ʱ��̶�
x=zeros(1,N);                        % x��ʼ��
for k=1 : 2 : 10                     % �����ź�
    x=x+(10/pi/k)*sin(2*pi*k*f0*t);  
end

fs2=fs/2;                            % �ο�˹��Ƶ��
wp=[40 60]/fs2; ws=[30 80]/fs2;      % ͨ�������
Rp=1; Rs=40;                         % ͨ�����ƺ����˥��
[M,Wn]=ellipord(wp,ws,Rp,Rs);        % ��ԭ���˲��������ʹ���
[B,A]=ellip(M,Rp,Rs,Wn);             % �������˲���ϵ��
[H,f]=freqz(B,A,1000,fs);            % �˲�����Ӧ����
gdy=grpdelay(B,A,1000,fs);           % Ⱥ�ӳ���Ӧ����
% ��ʾ�����˲���ϵ��
fprintf('B=%5.6e   %5.6e   %5.6e   %5.6e\n',B);
fprintf('\n');
fprintf('A=%5.6f   %5.6f   %5.6f   %5.6f\n',A);
fprintf('\n');
% ����һ
yy=filter(B,A,x);                    % ����һ:��filter�����������ź��˲�
% ������
for k=1 : 6                          % ��ʼ��
    xx(k)=0; y(k)=0;
end

for k=7 : N+6                        % ������:�ò�ַ��̶������ź��˲�
    j=k-6;
    xx(k)=x(j);
    y(k)=B(1)*xx(k)+B(2)*xx(k-1)+B(3)*xx(k-2)+B(4)*xx(k-3)+B(5)*xx(k-4)...
        +B(6)*xx(k-5)+B(7)*xx(k-6)-A(2)*y(k-1)-A(3)*y(k-2)-A(4)*y(k-3)...
        -A(5)*y(k-4)-A(6)*y(k-5)-A(7)*y(k-6);
end
y=y(7:end);                          % ����ź�y
% ��ͼ
figure(1)
subplot 211; plot(f,20*log10(abs(H)),'k');
title('��Բ��ͨ�˲�����Ƶ��Ӧ����')
xlabel('Ƶ��/Hz'); ylabel('��ֵ/dB');
axis([0 100 -60 5]); grid;
subplot 212; plot(f,gdy,'k');
title('��Բ��ͨ�˲���Ⱥ�ӳ���Ӧ����')
xlabel('Ƶ��/Hz'); ylabel('Ⱥ�ӳ�/����'); 
xlim([0 100]); grid
set(gcf,'color','w');
figure(2)
subplot 211; plot(t,x,'k');
title('�����źŲ���');
xlabel('ʱ��/s'); ylabel('��ֵ');
subplot 212; line(t,yy,'color',[.6 .6 .6],'linewidth',3); hold on
plot(t,y,'k');
title('����źŲ���');
legend('1','2',2)
xlabel('ʱ��/s'); ylabel('��ֵ'); box on;
set(gcf,'color','w');

