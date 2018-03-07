function [b,a]=design_cheby2
fs=8000;                       % ����Ƶ��
fs2=fs/2;
Wp=[500 1600]/fs2;             % ͨ������
Ws=[300 1800]/fs2;             % �������
Rp=1; Rs=40;                   % ����ϵ��
[n,Wn]=cheb2ord(Wp,Ws,Rp,Rs);  % ��n��Wn
[b,a]=cheby2(n,Rs,Wn);         % ���˲���ϵ��b��a