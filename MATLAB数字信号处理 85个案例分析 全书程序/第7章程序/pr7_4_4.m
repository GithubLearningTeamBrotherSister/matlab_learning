%
% pr7_4_4  
close all; clear all; clc

load damp_data2.mat          % ��������
plot(ti,x,'g');              % ��������x����
grid; hold on 
L=length(x);                 % ���ݳ���
x0=mean(x(L-50:L));          % ���ָ��˥����ֵ
u=x-x0;                      % ����ֱ������
plot(ti,u,'r','linewidth',2); % ��������u����
title('�ź���������ͼ');
xlabel('ʱ��/s'); ylabel('��ѹ/pu');
p=30;                        % ���ý״�
Z=signal_hpronys(u,p,fs,.01);% Prony����ȡ����
K=size(Z,1);                 % K��Ϊ���ٸ�����

y=zeros(1,L);                % ��ʼ��
for k=1 : K                  % ��ʾK���źŷ����Ĳ���
   fprintf('%4d     D=%5.6f   F=%5.6f  A=%6.5f  theta=%6.5f\n',...
       k,Z(k,1),Z(k,2),Z(k,3),Z(k,4));
% ��K�������ع����ź�y
   y=y+Z(k,3)*exp(Z(k,1)*ti).*cos(2*pi*Z(k,2)*ti+Z(k,4));
end
plot(ti,y,'k');              % �����ع��ź�y������
legend('�ź�����ֱ������ǰ','�ź�����ֱ��������','�ع��ź�');
snr=prony_snr(u,y);          % ����u��y�������
fprintf('SNR=%5.6f\n',snr);  % ��ʾ�����
set(gcf,'color','w');
