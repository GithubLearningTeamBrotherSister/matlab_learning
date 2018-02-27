clc
clear all
close all

% signal_x=randn(1,100)*100;
t=[0:0.05:2];
f=1;
signal_x=1000*sin(2*pi*f*t);
signal_out=pcm_encode(signal_x);

figure
subplot(2,1,1)
plot(signal_x)
subplot(2,1,2)
stairs(signal_out)
ylim([-0.5 1.5])

clock=[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1];

figure
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


