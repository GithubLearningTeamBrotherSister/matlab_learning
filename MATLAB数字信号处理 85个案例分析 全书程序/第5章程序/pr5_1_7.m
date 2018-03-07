%
% pr5_1_7 
clear, clc, close all

[x, fs] = wavread('minuniv.wav');   % ��������
x = x(:, 1);                        % ֻȡ��ͨ��
x = x/max(abs(x));                  % ��ֵ��һ��
xlen = length(x);                   % �źų���
t = (0:xlen-1)/fs;                  % ʱ������
wlen = 256;                         % ֡��
inc = wlen/4;                       % ֡��
nfft = wlen;                        % nfft��
% STFT�׷���--Spectrogram
[B, f, t_stft] = mystftfun(x, wlen, inc, nfft, fs);
% STFT��任
[x_istft, t_istft] = myistftfun(B, inc, nfft, fs);
slen=length(x_istft);               % ʹ�ع�������x�ȳ�
if slen>xlen, x_istft=x_istft(1:xlen); else x=x(1:slen); t=t_istft; end
Err=x_istft-x';                     % �����ع�����x_istft��x��ƫ��
Segma_e=var(Err);                   % �����ع�����x_istft��xƫ��ķ���
fprintf('Segma_e=%5.4e\n',Segma_e);
% ��ͼ
figure(1)
imagesc(t_stft,f,abs(B)); axis xy
xlabel('ʱ��/s'); ylabel('Ƶ��/Hz')
title('STFT��ͼ'); 
set(gcf,'color','w');
figure(2)
subplot 211; plot(t, x, 'r')
axis([0 max(t) -1.1 1.1]); grid on
xlabel('ʱ��/s'); ylabel('��ֵ')
title('ԭʼ�źź��ع��ź�'); hold on
plot(t_istft, x_istft, '-.k')
subplot 212; plot(t_istft, Err,'k')
xlabel('ʱ��/s'); ylabel('��ֵ')
title('ԭʼ�ź����ع��źŵ�ƫ��')
xlim([0 max(t)]);
set(gcf,'color','w');
