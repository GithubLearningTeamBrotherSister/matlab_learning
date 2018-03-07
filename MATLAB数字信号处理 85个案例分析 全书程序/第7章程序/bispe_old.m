%
% bispe_old
clear all; clc; close all;
N=128;                       % 数据长
n=0:1:127;                   % 数据索引
%load sam1 s; %从数据文件sam中装入采样数据到数组s
fs=50*32;                    % 采样频率
f0=50.5;                     % 基波频率
w=0.5-0.5*cos(2*pi*n./N);    % 海宁窗
xb=[11,2,1,0.5,0.3,0.1,0.05];    % 谐波幅值
Q=[0.9,0.8,0.7,0.6,0.5,0.3,0.2]; % 谐波初始相位
s=zeros(1,N);                % 初始化
for i=1:7                    % 产生谐波信号
    s=s+xb(i)*sin(2*pi*i*f0*n./fs+Q(i));
end

r=s.*w;                      % 信号乘以窗函数
v=fft(r,128);                % FFT
%vz=abs(v)/64*2;              % 取频谱的幅值
u=abs(v);                    % 取频谱的幅值
A=zeros(1,7);                % 初始化
B=zeros(1,7);
C=zeros(1,7);
for I=0:6                    % 计算基波和各阶谐波的参数
y1=u(5+4*I);                 % 设置y1,y2和y3
y2=u(6+4*I);
y3=u(4+4*I);
max=y2;                      % 设置y2为max(不是表示为最大，只是一个变量名称)
k=5+4*I;                     % k表示的索引（代表索引k1,k2=k1+1）
if y3>y2                     % 若y3>y2
    max=y3;                  % 改成y3为max
end
if max==y3                   % 若最大值为y3
    t=y1;                    % 暂把y1放入t
    y1=max;                  % y1为最大值
    y2=t;                    % y2为t
    k=4+4*I;                 % k表示的索引
end

b=(y2-y1)/(y2+y1);           % 按式(7-2-5)计算出beta
a=1.5*b;                     % 双峰谱线修正海宁窗的beta对alpha的表示式
A(I+1)=(k+a-0.5)*fs/N;       % 求出谐波的频率
% 按式(7-2-9)依海宁窗的窗函数关系计算出谐波的幅值
B(I+1)=(y1+y2)*(2.35619403+1.15543682*a^2+0.32607873*a^4+...
        0.07891461*a^6)/128;
C(I+1)=angle(v(k))-pi*(a+0.5);   % 求出谐波的初始相位
if C(I+1)>pi, C(I+1)=2*pi-C(I+1); end
fprintf('%4d     %5.6f  %5.6f  %5.6f\n',I+1,A(I+1),B(I+1),C(I+1)+pi/2); % 显示
end