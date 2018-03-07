clc
clear all
<<<<<<< HEAD
close allsyms 
=======
close all

>>>>>>> origin/master
%% 新建一个信号并调用pcm_encode函数对其进行pcm编码
% 信号采时间长度2秒，频率1Hz，信号幅值1000
t=[0:0.05:2];
f=1;
signal_x=1000*sin(2*pi*f*t);
signal_out=pcm_encode(signal_x);

%% 在两个分立窗口中分别绘制原始信号signal_x和编码后的信号signal_out
figure
subplot(2,1,1)
plot(signal_x)
subplot(2,1,2)
stairs(signal_out)
ylim([-0.5 1.5])

%% 绘制三个分离窗口，用来显示编码特定位置的细节
figure
%设定一个时钟，用来做参考
clock=[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1];
subplot(3,1,1)
stairs(clock)
legend('clock')
ylim([-0.5 1.5])
subplot(3,1,2)
stairs(signal_out(17:24))
signal_x(3)
legend('signal_x(3)=578')
ylim([-0.5 1.5])
subplot(3,1,3)
stairs(signal_out(25*8+1:26*8))
ylim([-0.5 1.5])
signal_x(26)
legend('signal_x(3)=1000')


