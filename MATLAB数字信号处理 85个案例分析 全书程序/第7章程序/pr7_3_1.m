%
% pr7_3_1 
clear all; clc; close all;

N=1024;                      % ��������
n=0:N-1;                     % ������
w=0.5-0.5*cos(2*pi*n/N);     % ������
alpha=-0.5:0.01:0.5;         % ����alphaʸ��
M=length(alpha);             % alpha�ĳ���
for k=1 : M                  % ����beta��alpha�Ĺ�ϵ����alpha��nu�Ĺ�ϵ
    al=alpha(k);             % ȡһ��alphaֵ
    dk1=-al+0.5;             % ����-alpha+0.5
    dk2=-al-0.5;             % ����-alpha-0.5
    W1=dtft_dkm(w,dk1,0);    % ����ʽ(7-3-3)�ķ��ӵ�1��
    W2=dtft_dkm(w,dk2,0);    % ����ʽ(7-3-3)�ķ��ӵ�2��
    beta(k)=(abs(W1)-abs(W2))/(abs(W1)+abs(W2)); % ���betaֵ
    nu(k)=2*N/(abs(W1)+abs(W2));              % ���nuֵ 
end
a=polyfit(beta,alpha,6);     % ����beta��alpha����϶���ʽϵ��
y=polyval(a,beta);           % ����beta��alpha���������
% ��ͼ����ʾbeta��alpha��϶���ʽϵ��
subplot 211; plot(beta,alpha,'k'); hold on
plot(beta,y,'r'); grid
xlabel('\beta'); ylabel('\alpha');
title('\alpha=g^-^1(\beta)')
fprintf('%5.6f   %5.6f   %5.6f   %5.6f\n',a)
fprintf('\n');
subplot 212; plot(alpha,nu,'k'); hold on
a=polyfit(alpha,nu,6);       % ����alpha��nu����϶���ʽϵ��
y=polyval(a,alpha);          % ����alpha��nu���������
% ��ͼ����ʾalpha��nu��϶���ʽϵ��
subplot 212; plot(alpha,nu,'k'); hold on
plot(alpha,y,'r'); grid
xlabel('\alpha'); ylabel('\nu');
title('\nu(\alpha)')
fprintf('%5.6f   %5.6f   %5.6f   %5.6f\n',a);
fprintf('\n');


