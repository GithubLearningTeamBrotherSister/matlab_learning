%
% pr3_15_3 
clear all; clc; close all;

d = fdesign.lowpass('Fp,Fst,Ap,Ast',0.25,0.4,0.25,40);  % �����˲����Ĳ�������
designmethods (d)         % ���������������õ��˲���
hd = design(d,'ellip');   % �������ѩ��I���˲���
[B,A]=tf(hd);             % ����˲���ϵ��

[N,wn]=ellipord(0.25,0.4,0.25,40); % �Դ�ͳʹ�÷������˲����Ľ����ʹ���
[b,a]=ellip(N,0.25,40,wn);         % �����˲�����ϵ��
% ��һ������ʾϵ��
fprintf('B=%5.6f   %5.6f   %5.6f   %5.6f   %5.6f\n',B);
fprintf('A=%5.6f   %5.6f   %5.6f   %5.6f   %5.6f\n\n',A);

fprintf('b=%5.6f   %5.6f   %5.6f   %5.6f   %5.6f\n',b);
fprintf('a=%5.6f   %5.6f   %5.6f   %5.6f   %5.6f\n\n',a);

% �ڶ�������ʾ�����ṹ��ϵ��
hd
info(hd)                  % ��ʾhd�е���Ϣ
AB=hd.sosMatrix;          % ȡ��hd�е�ϵ������
BB=AB(:,1:3);             % ת����B��A
AA=AB(:,4:6);
G=hd.ScaleValues;         % ȡ��hd�е����沿��
% ��ʾ�����ṹ��ϵ��ֵ������ֵ
for k=1 : 2
    fprintf('��%2d��\n',k)
    fprintf('BB=%5.6f   %5.6f   %5.6f\n',BB(k,:))
    fprintf('AA=%5.6f   %5.6f   %5.6f\n',AA(k,:))
    fprintf('G(%2d)=%5.6f\n',k,G(k))
end
fprintf('G( 3)=%5.6f\n',G(3))


