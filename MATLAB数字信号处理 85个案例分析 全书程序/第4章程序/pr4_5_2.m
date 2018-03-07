%
% pr4_5_2 from sy12
clear all; clc; close all;

k=1:500;                    % ����һ����0��2*pi����������Ϊ500               
dn=2*pi/500;
x=cos((k-1)*dn);            % ����һ�����������ź�
[val,loc]=min(x);           % ��������ź��е���Сֵ��ֵ��λ��
N=length(x);                % ���ݳ�
ns=randn(1,N);              % ��������ź�
y=x+ns(1:N)*0.1;            % ���ɴ����ź�
Err=var(x-y);               % ��x-y�ķ���
fprintf('%4d   %5.4f   %5.6f\n',loc,val,Err);

y=y';                       % ת��������
z1=smooth(y,51,'moving');   % 'moving'ƽ��
Err1=var(x'-z1);            % ��x-z1�ķ��� 
[v1,k1]=min(z1);            % ���ƽ���ź�z1�е���Сֵ��ֵ��λ��
fprintf('1  %4d   %5.4f   %4d   %5.6f\n',k1,v1,abs(loc-k1),Err1);  % ��ʾ

z2=smooth(y,51,'lowess');   % 'lowess'ƽ��
Err2=var(x'-z2);            % ��x-z2�ķ���
[v2,k2]=min(z2);            % ���ƽ���ź�z2�е���Сֵ��ֵ��λ��
fprintf('2  %4d   %5.4f   %4d   %5.6f\n',k2,v2,abs(loc-k2),Err2);

z3=smooth(y,51,'loess');    % 'loess'ƽ��
Err3=var(x'-z3);            % ��x-z3�ķ���
[v3,k3]=min(z3);            % ���ƽ���ź�z3�е���Сֵ��ֵ��λ��
fprintf('3  %4d   %5.4f   %4d   %5.6f\n',k3,v3,abs(loc-k3),Err3);

z4=smooth(y,51,'sgolay',3); % 'sgolay'ƽ��
Err4=var(x'-z4);            % ��x-z4�ķ���
[v4,k4]=min(z4);            % ���ƽ���ź�z4�е���Сֵ��ֵ��λ��
fprintf('4  %4d   %5.4f   %4d   %5.6f\n',k4,v4,abs(loc-k4),Err4);

z5=smooth(y,51,'rlowess');  % 'rlowess'ƽ��
Err5=var(x'-z5);            % ��x-z5�ķ���
[v5,k5]=min(z5);            % ���ƽ���ź�z5�е���Сֵ��ֵ��λ��
fprintf('5  %4d   %5.4f   %4d   %5.6f\n',k5,v5,abs(loc-k5),Err5);

z6=smooth(y,51,'rloess');   % 'rloess'ƽ��
Err6=var(x'-z6);            % ��x-z6�ķ���
[v6,k6]=min(z6);            % ���ƽ���ź�z6�е���Сֵ��ֵ��λ��
fprintf('6  %4d   %5.4f   %4d   %5.6f\n',k6,v6,abs(loc-k6),Err6);
% ��ͼ
subplot 211; plot(k,x,'k');
grid; xlim([0 500]); title('һ���������ź�')
xlabel('����'); ylabel('��ֵ')
subplot 212; plot(k,y,'k'); %hold on
grid; axis([0 500 -1.5 1.5]); title('����һ���������ź�')
xlabel('����'); ylabel('��ֵ')
set(gcf,'color','w');

figure
subplot 321; plot(k,z1,'k'); title('moving��')
grid; axis([0 500 -1.5 1.5]); ylabel('��ֵ')
subplot 322; plot(k,z2,'k');  title('lowess��')
grid; axis([0 500 -1.5 1.5]); ylabel('��ֵ')
subplot 323; plot(k,z3,'k'); title('loess��')
grid; axis([0 500 -1.5 1.5]); ylabel('��ֵ')
subplot 324; plot(k,z4,'k'); title('sgolay��')
grid; axis([0 500 -1.5 1.5]); ylabel('��ֵ')
subplot 325; plot(k,z5,'k'); title('rlowess��')
grid; axis([0 500 -1.5 1.5]); xlabel('����'); ylabel('��ֵ')
subplot 326; plot(k,z6,'k'); title('rloess��')
grid; axis([0 500 -1.5 1.5]); xlabel('����'); ylabel('��ֵ')
set(gcf,'color','w');


