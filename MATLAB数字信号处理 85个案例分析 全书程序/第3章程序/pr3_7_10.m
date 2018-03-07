% 
% pr3_7_10 
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

[b0,b,a]=dir2cas(B,A);               % ���˲���ϵ���ֽ�Ϊ������ϵͳ��ϵ��
fprintf('B1=%5.6f   %5.6f   %5.6f\n',b(1,:));
fprintf('A1=%5.6f   %5.6f   %5.6f\n',a(1,:));
fprintf('\n');
fprintf('B2=%5.6f   %5.6f   %5.6f\n',b(2,:));
fprintf('A2=%5.6f   %5.6f   %5.6f\n',a(2,:));
fprintf('\n');
fprintf('B3=%5.6f   %5.6f   %5.6f\n',b(3,:));
fprintf('A3=%5.6f   %5.6f   %5.6f\n',a(3,:));
fprintf('\n');
% ����һ
yy=casfiltr(b0,b,a,x);               % ����һ:��casfiltr�����������ź��˲�
% ������
u(1)=0; u(2)=0;                      % ��ʼ��
v(1)=0; v(2)=0;
y(1)=0; y(2)=0;
xx(1)=0; xx(2)=0;
% ������:����ϵͳ�Ĳ�ַ��̶������ź��˲�
for k=3 : N+2
    j=k-2;
    xx(k)=x(j);
    u(k)=b(1,1)*xx(k)+b(1,2)*xx(k-1)+b(1,3)*xx(k-2)-a(1,2)*u(k-1)-a(1,3)*u(k-2);
    v(k)=b(2,1)*u(k)+b(2,2)*u(k-1)+b(2,3)*u(k-2)-a(2,2)*v(k-1)-a(2,3)*v(k-2);
    y(k)=b(3,1)*v(k)+b(3,2)*v(k-1)+b(3,3)*v(k-2)-a(3,2)*y(k-1)-a(3,3)*y(k-2);
end
y=b0*y(3:end);                       % ����ź�y
% ��ͼ
subplot 211; plot(t,x,'k');
title('�����źŲ���');
xlabel('ʱ��/s'); ylabel('��ֵ');
subplot 212; line(t,yy,'color',[.6 .6 .6],'linewidth',3); hold on
plot(t,y,'k');
title('����źŲ���');
legend('1','2',2)
xlabel('ʱ��/s'); ylabel('��ֵ'); box on;
set(gcf,'color','w');

