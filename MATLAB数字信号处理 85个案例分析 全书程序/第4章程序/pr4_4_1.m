%
% pr4_4_1 
clear all; clc; close all;

x=load('lg1.txt');                   % ��������
N=length(x);                         % ���ݳ���
n=1:N;                               % ����������
dx=diff(x);                          % ��һ�׵���
Xdex=find(dx<0);                     % Ѱ��һ�׵���Ϊ��ֵ
Xseg=findSegment(Xdex);              % Ѱ��һ�׵���Ϊ��ֵ������
Xsel=length(Xseg);                   % ����Ϊ��ֵ����ĸ���
for k=1 :Xsel                        % ��ʾ����Ϊ��ֵ�������ʼ,�����ͳ���
    fprintf('%4d   %4d   %4d   %4d\n',k,Xseg(k).begin,...
        Xseg(k).end,Xseg(k).duration);
    X_begin(k)=Xseg(k).begin;        % ���õ���Ϊ��ֵ������ʼλ�õ�����
    X_duration(k)=Xseg(k).duration;  % ���õ���Ϊ��ֵ���䳤�ȵ�����
end
Xpdex=find(dx>0);                     % Ѱ��һ�׵���Ϊ��ֵ
Xpseg=findSegment(Xpdex);             % Ѱ��һ�׵���Ϊ��ֵ������
Xpsel=length(Xpseg);                  % ����Ϊ��ֵ����ĸ���
for k=1 :Xpsel                        % ��ʾ����Ϊ��ֵ�������ʼ,�����ͳ���
    fprintf('%4d   %4d   %4d   %4d\n',k,Xpseg(k).begin,...
        Xpseg(k).end,Xpseg(k).duration);
    Xp_begin(k)=Xpseg(k).begin;       % ���õ���Ϊ��ֵ������ʼλ�õ�����
    Xp_duration(k)=Xpseg(k).duration; % ���õ���Ϊ��ֵ���䳤�ȵ�����
end
% ����һ�׵���Ϊ��ֵ�������,Ѱ�ҵ�1���ȵĿ�ʼλ��
pnb=find(X_begin>10);                % Ѱ��������ʼλ��Ҫ����10
pn=find(X_duration(pnb)>2);          % Ѱ�����䳤��Ҫ����2
kk=pnb(pn);                          % �����������������ʼλ��              
Stpn=Xseg(kk(1)).begin;              % ��õ�1�����ȵĿ�ʼλ��
% ����һ�׵���Ϊ��ֵ�������,Ѱ�ҵ�1���ȵĽ���λ��
ppnb=find(Xp_begin>Stpn);            % Ѱ��������ʼλ��Ҫ����Stpn�Ŀ�ʼλ��
ppn=find(Xp_duration(ppnb)>2);       % Ѱ�����䳤��Ҫ����2
kk1=ppnb(ppn);                       % ������������������λ��  
Edpn=Xpseg(kk1(1)).end;              % ��õ�1�����ȵĽ���λ��
% ��ͼ
subplot 211; plot(n,x,'k')
hold on; axis([0 N 3200 3800]); grid
xlabel('����'); ylabel('��ֵ')
title('�źŲ���')
subplot 212; plot(n,[0 dx],'k'); grid; xlim([0 N]);
xlabel('����'); ylabel('һ�׵���ֵ')
title('һ�׵�������')
subplot 211; plot(Stpn,x(Stpn),'rO','linewidth',5);
plot(Edpn,x(Edpn),'gO','linewidth',5);
fprintf('��ʼλ��=%4d    ����λ��=%4d\n',Stpn,Edpn);
set(gcf,'color','w');



