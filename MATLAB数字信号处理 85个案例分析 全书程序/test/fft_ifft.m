clear all
close all

fs=1000;

xrandn=randn(1,100)+10*sin(2*2*pi*[0.01:0.01:1]);
xranfft=fft(xrandn,100);
xranfftA=2*abs(xranfft)/100;
% xranfftW=atan(xranfft);
xranfftW=angle(xranfft);
xrandnifftA=ifft(xranfft);

subplot(411)
plot(xrandn)
subplot(412)
plot(real(xranfft))
subplot(413)
stem(xranfftA)
subplot(414)
plot(xranfftW)




disp('________________________运行分割线_________________________')