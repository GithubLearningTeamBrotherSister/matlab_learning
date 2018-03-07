%
% pr3_7_1 
clear all; clc; close all;

bs=[1,1];as=[1,5,6];            % ϵͳ���ӷ�ĸϵ������
Fs=10; T=1/Fs;                  % ����Ƶ�ʺͲ������
[Ra,pa,ha]=residue(bs, as);	    % ��ģ���˲���ϵ��������Ϊģ�⼫�������
pd=exp(pa*T);			        % ��ģ�⼫���Ϊ���֣�zƽ�棩����pd
[bd,ad]=residuez(T*Ra, pd, ha);	% ��ԭ����Ra�����ּ���pd��������˲���ϵ��
t=0:0.1:3;                      % ʱ������
ha=impulse(bs,as,t);            % ����ģ��ϵͳ��������Ӧ
hd=impz(bd,ad,31);              % ����ϵͳ��������Ӧ
% ����impinvar�������������˲���ϵ��
[Bd,Ad]=impinvar(bs,as,Fs);
fprintf('bd=%5.4f   %5.4f   ad=%5.4f   %5.4f   %5.4f\n\n',bd,ad);
fprintf('Bd=%5.4f   %5.4f   Ad=%5.4f   %5.4f   %5.4f\n',Bd,Ad);
% ��ͼ
plot(t,ha*T,'r','linewidth',3); hold on; grid on;
plot(t,hd,'k');
legend('ģ���˲���������Ӧ','�����˲���������Ӧ');
xlabel('ʱ��/s'); ylabel('��ֵ/dB');
title('ԭģ���˲�����������Ӧ�������˲�����������Ӧ�Ƚ�')
set(gcf,'color','w')            

