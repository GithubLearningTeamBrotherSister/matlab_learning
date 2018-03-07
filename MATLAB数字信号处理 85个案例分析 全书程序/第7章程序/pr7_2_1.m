% pr7_2_1  
% ������
clear all; clc; close all;

N=1024;                      % ��������
n=0:N-1;                     % ������
w=0.5-0.5*cos(2*pi*n/N);     % ������
alpha=0:0.01:1;              % ����alphaʸ��
M=length(alpha);             % alpha�ĳ���
for k=1 : M                  % ����beta��alpha�Ĺ�ϵ
    al=alpha(k);             % ȡһ��alphaֵ
    dk1=-al;                 % ����-alpha
    dk2=1-al;                % ����1-alpha
    W1=dtft_dkm(w,dk1,0);    % ����ʽ(7-2-13)�ķ�ĸ
    W2=dtft_dkm(w,dk2,0);    % ����ʽ(7-2-13)�ķ���
    beta(k)=abs(W2)/abs(W1); % ���betaֵ
end
a=polyfit(beta,alpha,7);     % ����beta��alpha����϶���ʽϵ��
y=polyval(a,beta);           % ����beta��alpha���������
% ��ͼ����ʾbeta��alpha��϶���ʽϵ��
subplot 211; plot(beta,alpha,'k'); hold on
plot(beta,y,'r'); grid
xlabel('\beta'); ylabel('\alpha');
title('\alpha=g^-^1(\beta)')
fprintf('%5.6f   %5.6f   %5.6f   %5.6f\n',a)
fprintf('\n');

gamma=-0.5:0.01:0.5;         % ����gammaʸ��
M=length(gamma);             % gamma����
for k=1 : M                  % ����gamma��Ap�Ĺ�ϵ
    al=gamma(k);             % ȡһ��gammaֵ
    dk1=-al;                 % ����-gamma
    W1=dtft_dkm(w,dk1,0);    % ����ʽ(7-2-14)�ķ�ĸ
    Ap(k)=2*N/abs(W1);       % ���Apֵ
end
a=polyfit(gamma,Ap,6);       % ����gamma��Ap����϶���ʽϵ��
y=polyval(a,gamma);          % ����gamma��Ap���������
% ��ͼ����ʾgamma��Ap��϶���ʽϵ��
subplot 212; plot(gamma,Ap,'k'); grid;
plot(gamma,y,'r'); grid
xlabel('\gamma'); ylabel('Ap'); 
title('Ap=\lambda(\gamma)')
fprintf('%5.6f   %5.6f   %5.6f   %5.6f\n',a)
fprintf('\n');
set(gcf,'color','w'); 